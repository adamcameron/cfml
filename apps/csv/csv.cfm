<cfscript>
/**
	@hint Initialises the object
	@csvData a string containing CSV data
	@hasHeaders a boolean value flagging whether the first row is column names or data
	@strict a boolean flag that sets whether to follow the CSV RFC or whether to allow whitespace between values
*/
public any function parseCsv(required string csvData, boolean hasHeaders=false, boolean strict=true, string returnFormat="query", function formatter){
	// Gets the next row from the CSV data
	var getRow = function(){
		var field			= {};
		var row				= [];
		var stSimpleField	= {};
		while (!isEof()) {
			field = getField();
			arrayAppend(row, field.value);
			if (field.eol){
				break;
			}
		}
		return row;
	};
	//  Gets the next field from the row of CSV data
	var getField = function(){
		// first identify what we've got
		var nextChar = getNextChar();
		var field	= {
			value	= "",
			eol		= false
		};
		if (nextChar == '"'){
			field = getQuotedField();
		}else if(nextChar == ","){	// basically it was empty
			field.value = "";
			currentPos++;
		}else if(isCrLf()){
			field.eol = true;
		}else{
			field = getSimpleField();
		}
		if (field.eol){
			while (isCrLf() && !isEof()){
				currentPos++;
			};
		}
		return field;
	};

	// Returns true if processing has got to the end of the "file" (the raw CSV data)
	var isEof = function(){
		return currentPos > rawDataLen;
	};

	// Returns true if the current char is a CRLF character
	var isCrLf = function(){
		return (!isEof()) && find(mid(rawData, currentPos, 1), "#chr(13)##chr(10)#");
	};

	// Gets the next char to read.  The "next char" is used to check whether the field value is quoted or not
	var getNextChar = function(){
		if (!strict){
			// we're going to allow leading space between the separator and the data.  THIS IS ACTUALLY CONTRARY TO THE UNOFFICIAL CSV RFC, but people seem to do it anyhow
			// that regex is a tab then a space, btw (you could easily miss the space there)
			while (reFind("[\t ]", mid(rawData, currentPos, 1)) && !isEof()){
				currentPos++;
			}
		}
		return mid(rawData, currentPos, 1);
	};
	
	// Handles fields that are quoted
	var getQuotedField = function(){
		var stValue = reFind('".*?[^"]"(?!")(?=([\r\n]?))', rawData, currentPos, true);
		var field	= {
			value	= "",
			eol		= false
		};
		if (stValue.pos[1] >= 0){
			field.value = mid(rawData, currentPos, stValue.len[1]);	// this includes the quotes
			field.value = reReplace(field.value, '^"(.*)"$', "\1", "ONE");	// this removes them
			field.value = replace(field.value, '""', '"', "ALL");	// and this unescapes the embedded ones
			currentPos +=  (stValue.len[1] + 1);
			if (stValue.len[2] > 0){
				field.eol = true;
			}
		}else{
			throw(type="InvalidDataException", message="Could not extract field", detail="Could not find the end of a quoted field starting at position #currentPos#");
		}
		return field;
	};

	// Handles fields that are just simple values (no embedded quotes or line feeds)
	var getSimpleField = function(){
		var stValue = reFind('[^\r\n]*?(?=,|(\r|\n|$))', rawData, currentPos, true);
		var field	= {
			value	= "",
			eol		= false
		};
		if (stValue.pos[1] >= 0){
			field.value = mid(rawData, currentPos, stValue.len[1]);
			currentPos += (stValue.len[1] + 1);
			if (stValue.pos[2] > 0){
				field.eol = true;
			}
		}else{
			throw(type="InvalidDataException", message="Could not extract field", detail="Could not find the end of a non-quoted field starting at position #currentPos#");
		}
		return field;
	};

	// Sets the generic header names if not header data was available in the CSV.  Column names are COLUMN_n where n is the column number, eg: COLUMN_1,COLUMN_2,COLUMN_3
	var setGenericHeaders = function(numeric columnCount){
		var aHeaders	= [];
		var iHeader	= 0;
		
		for (iHeader=1; iHeader <= arguments.columnCount; iHeader++){
			arrayAppend(aHeaders, "COLUMN_#iHeader#");
		}
		return aHeaders;
	};

	// Returns the parsed CSV data as a query. The columns will either be as stated in the CSV if it was initialised with hasHeaders=true, or with generic columns COLUMN_n where n is the number of the column, eg: COLUMN_1,COLUMN_2,COLUMN_r3
	var toQuery = function(){
		var query				= queryNew(arrayToList(parsedData.headers));
		var iRow			= 0;
		var iCol			= 0;
		var iHeaderCount	= arrayLen(parsedData.headers);	// we use this in a loop, so just to the calc once
		
		for (iRow=1; iRow <= arrayLen(parsedData.rows); iRow++){
			queryAddRow(query);
			for (iCol=1; iCol <= iHeaderCount; iCol++){
				querySetCell(query, parsedData.headers[iCol], parsedData.rows[iRow][iCol]);
			}
		}
		return query;
	};

	// Returns the parsed CSV data as an array or structs. The struct's key names will either be as stated in the CSV if it was initialised with hasHeaders=true, or with generic keys COLUMN_n where n is the number of the column, eg: COLUMN_1,COLUMN_2,COLUMN_r3
	var toArray = function(){
		var array				= [];
		var iRow			= 0;
		var iCol			= 0;
		var stRow			= {};
		var iHeaderCount	= arrayLen(parsedData.headers);	// we use this in a loop, so just to the calc once
		
		for (iRow=1; iRow <= arrayLen(parsedData.rows); iRow++){
			stRow = {};
			for (iCol=1; iCol <= iHeaderCount; iCol++){
				stRow[parsedData.headers[iCol]] = parsedData.rows[iRow][iCol];
			}
			arrayAppend(array, stRow);
		}
		return array;
	};

	var rawData		= arguments.csvData;
	var rawDataLen	= len(rawData);	// we use this a number of times, so work it out once
	
	var row				= [];
	var columnCount		= 0;
	var parsedData		= {
		headers	= [],
		rows	= []
	};

	var currentPos		= 1;	// ie: first char of file
	
	// get the first row... we handle this "special" cos it could be header or it could be data
	row = getRow();
	columnCount = arrayLen(row);	// there needs to be the same number of fields per row, and it needs to match the first row
	
	if (hasHeaders){
		parsedData.headers = row;
	}else{
		parsedData.headers = setGenericHeaders(columnCount);
		arrayAppend(parsedData.rows, row);	// ie: if we've not got headers, we need to add it as the first row of data
	}
	
	// get the rest of the data
	while (!isEof()){
		row = getRow();
		
		// if the last entry empty (so like a trailing comma) with no CRLF, we won't have noticed it.  Not happy about having this exception here, probably needs refactoring
		if (isEof() && arrayLen(row) != columnCount){
			arrayAppend(row, "");
		}
		
		if (arrayLen(row) != columnCount){	// All rows need to have the same number of columns.  This is a rule of the RFC
			writeDump(var=row, label="row with wrong column count");
			writeDump(var=parsedData, label="Already parsed");
			throw(
				type	= "InvalidDataException",
				message	= "Incorrect number of columns encountered",
				detail	= "Row #arrayLen(parsedData.rows)+1# had an incorrect number of columns. Expect #columnCount#, found #arrayLen(row)#; #serializeJson(row)#"
			);
		}
		arrayAppend(parsedData.rows, row);
	}
	
	// transform it
	if (structKeyExists(arguments, "formatter")){
		return arguments.formatter(parsedData);
	}else{
		switch (arguments.returnFormat){
			case "query": {
				return toQuery();
				break;
			}
			case "array": {
				return toArray();
				break;
			}
			default: {
				throw(
					type	= "InvalidFormatException",
					message	= "Incorrect returnFormat specified",
					detail	= "The specified returnFormat - #arguments.returnFormat# - is invalid. It must be one of QUERY or ARRAY, or a FORMATTER callback must be used"
				);
			}
		}
	}
}
	

toStruct = function(data){
	return data;
};

</cfscript>


<cfflush interval="16">
<cfscript>
	csvData = fileRead(expandPath("./complexLarge.csv"));
	
	start = getTickCount();
	result = parseCsv(csvData=csvData, hasheaders=true, strict=true, returnFormat="array");
	//result = parseCsv(csvData=csvData, hasheaders=true, strict=true, formatter=toStruct);
writeOutput("#getTickCount() - start#ms<br />");
	//writeDump(result);
</cfscript>
<cfoutput>
<!---<pre>
#csvData#
</pre>--->
</cfoutput>