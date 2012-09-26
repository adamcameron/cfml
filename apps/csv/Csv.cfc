component {

	/**
		@hint Initialises the object
		@csvData a string containing CSV data
		@hasHeaders a boolean value flagging whether the first row is column names or data
		@strict a boolean flag that sets whether to follow the CSV RFC or whether to allow whitespace between values
	*/
	public Csv function init(string csvData, boolean hasHeaders=false, strict=true){
		variables.rawData		= arguments.csvData;
		variables.rawDataLen	= len(variables.rawData);	// we use this a number of times, so work it out once
		variables.hasHeaders	= arguments.hasHeaders;
		variables.strict		= arguments.strict;
		
		variables.parsedData = parse();
		
		return this;
	}
	

	/**
		@hint Returns the parsed CSV data as a query. The columns will either be as stated in the CSV if it was initialised with hasHeaders=true, or with generic columns COLUMN_n where n is the number of the column, eg: COLUMN_1,COLUMN_2,COLUMN_r3
	*/
	public query function toQuery(){
		var q				= queryNew(arrayToList(variables.parsedData.headers));
		var iRow			= 0;
		var iCol			= 0;
		var iHeaderCount	= arrayLen(variables.parsedData.headers);	// we use this in a loop, so just to the calc once
		
		for (iRow=1; iRow <= arrayLen(variables.parsedData.rows); iRow++){
			queryAddRow(q);
			for (iCol=1; iCol <= iHeaderCount; iCol++){
				querySetCell(q, variables.parsedData.headers[iCol], variables.parsedData.rows[iRow][iCol]);
			}
		}
		return q;
	}


	/**
		@hint Returns the parsed CSV data as an array or structs. The struct's key names will either be as stated in the CSV if it was initialised with hasHeaders=true, or with generic keys COLUMN_n where n is the number of the column, eg: COLUMN_1,COLUMN_2,COLUMN_r3
	*/
	public array function toArray(){
		var a				= [];
		var iRow			= 0;
		var iCol			= 0;
		var stRow			= {};
		var iHeaderCount	= arrayLen(variables.parsedData.headers);	// we use this in a loop, so just to the calc once
		
		for (iRow=1; iRow <= arrayLen(variables.parsedData.rows); iRow++){
			stRow = {};
			for (iCol=1; iCol <= iHeaderCount; iCol++){
				stRow[variables.parsedData.headers[iCol]] = variables.parsedData.rows[iRow][iCol];
			}
			arrayAppend(a, stRow);
		}
		return a;
	}
	
	
	/* PRIVATE METHODS FROM HERE-ON DOWN */


	/**
		@hint Parses the CSV data and stored it internally in a generic format
	*/
	private struct function parse(){
		var aRow				= [];
		var columnCount			= 0;
		var stParsed			= {
			headers	= [],
			rows	= []
		};

		variables.iCurrentPos	= 1;	// ie: first char of file
		
		// get the first row... we handle this "special" cos it could be header or it could be data
		aRow = getRow();
		columnCount = arrayLen(aRow);	// there needs to be the same number of fields per row, and it needs to match the first row
		
		if (variables.hasHeaders){
			stParsed.headers = aRow;
		}else{
			stParsed.headers = setGenericHeaders(columnCount);
			arrayAppend(stParsed.rows, aRow);	// ie: if we've not got headers, we need to add it as the first row of data
		}
		
		// get the rest of the data
		while (!isEof()){
			aRow = getRow();
			
			// if the last entry empty (so like a trailing comma) with no CRLF, we won't have noticed it.  Not happy about having this exception here, probably needs refactoring
			if (isEof() && arrayLen(aRow) != columnCount){
				arrayAppend(aRow, "");
			}
			
			if (arrayLen(aRow) != columnCount){	// All rows need to have the same number of columns.  This is a rule of the RFC
				writeDump(var=aRow, label="aRow with wrong column count");
				writeDump(var=stParsed, label="Already parsed");
				throw(
					type	= "InvalidDataException",
					message	= "Incorrect number of columns encountered",
					detail	= "Row #arrayLen(stParsed.rows)+1# had an incorrect number of columns. Expect #columnCount#, found #arrayLen(aRow)#; #serializeJson(aRow)#"
				);
			}
			arrayAppend(stParsed.rows, aRow);
		}
		return stParsed;
	}


	/**
		@hint Gets the next row from the CSV data
	*/
	private array function getRow(){
		var stField = {};
		var aRow	= [];
		var stSimpleField = {};
		while (!isEof()) {
			stField = getField();
			arrayAppend(aRow, stField.value);
			if (stField.eol){
				break;
			}
		}

		return aRow;
	}


	/**
		@hint Gets the next field from the row of CSV data
	*/
	private struct function getField(){
		// first identify what we've got
		var nextChar = getNextChar();
		var stField	= {
			value	= "",
			eol		= false
		};
		if (nextChar == '"'){
			stField = getQuotedField();
		}else if(nextChar == ","){	// basically it was empty
			stField.value = "";
			variables.iCurrentPos++;
		}else if(isCrLf()){
			stField.eol = true;
		}else{
			stField = getSimpleField();
		}
		if (stField.eol){
			while (isCrLf() && !isEof()){
				variables.iCurrentPos++;
			};
		}
		return stField;
	}


	/**
		@hint Handles fields that are quoted
	*/
	private struct function getQuotedField(){
		var stValue = reFind('".*?[^"]"(?!")(?=([\r\n]?))', variables.rawData, variables.iCurrentPos, true);
		var stField	= {
			value	= "",
			eol		= false
		};
		if (stValue.pos[1] >= 0){
			stField.value = mid(variables.rawData, variables.iCurrentPos, stValue.len[1]);	// this includes the quotes
			stField.value = reReplace(stField.value, '^"(.*)"$', "\1", "ONE");	// this removes them
			stField.value = replace(stField.value, '""', '"', "ALL");	// and this unescapes the embedded ones
			variables.iCurrentPos +=  (stValue.len[1] + 1);
			if (stValue.len[2] > 0){
				stField.eol = true;
			}
		}else{
			throw(type="InvalidDataException", message="Could not extract field", detail="Could not find the end of a quoted field starting at position #variables.iCurrentPos#");
		}
		return stField;
	}


	/**
		@hint Handles fields that are just simple values (no embedded quotes or line feeds)
	*/
	private struct function getSimpleField(){
		var stValue = reFind('[^\r\n]*?(?=,|(\r|\n|$))', variables.rawData, variables.iCurrentPos, true);
		var stField	= {
			value	= "",
			eol		= false
		};
		if (stValue.pos[1] >= 0){
			stField.value = mid(variables.rawData, variables.iCurrentPos, stValue.len[1]);
			variables.iCurrentPos += (stValue.len[1] + 1);
			if (stValue.pos[2] > 0){
				stField.eol = true;
			}
		}else{
			throw(type="InvalidDataException", message="Could not extract field", detail="Could not find the end of a non-quoted field starting at position #variables.iCurrentPos#");
		}
		return stField;
	}


	/**
		@hint Gets the next char to read.  The "next char" is used to check whether the field value is quoted or not
	*/
	private string function getNextChar(){
		if (!variables.strict){
			// we're going to allow leading space between the separator and the data.  THIS IS ACTUALLY CONTRARY TO THE UNOFFICIAL CSV RFC, but people seem to do it anyhow
			// that regex is a tab then a space, btw (you could easily miss the space there)
			while (reFind("[\t ]", mid(variables.rawData, variables.iCurrentPos, 1)) && !isEof()){
				variables.iCurrentPos++;
			}
		}
		return mid(variables.rawData, variables.iCurrentPos, 1);
	}


	/**
		@hint Sets the generic header names if not header data was available in the CSV.  Column names are COLUMN_n where n is the column number, eg: COLUMN_1,COLUMN_2,COLUMN_3
	*/
	private array function setGenericHeaders(numeric columnCount){
		var aHeaders	= [];
		var iHeader	= 0;
		
		for (iHeader=1; iHeader <= arguments.columnCount; iHeader++){
			arrayAppend(aHeaders, "COLUMN_#iHeader#");
		}
		return aHeaders;
	}


	/**
		@hint Returns true if the current char is a CRLF character
	*/
	private boolean function isCrLf(){
		return (!isEof()) && find(mid(variables.rawData, variables.iCurrentPos, 1), "#chr(13)##chr(10)#");
	}


	/**
		@hint Returns true if processing has got to the end of the "file" (the raw CSV data)
	*/
	private boolean function isEof(){
		return variables.iCurrentPos > variables.rawDataLen;
	}

}