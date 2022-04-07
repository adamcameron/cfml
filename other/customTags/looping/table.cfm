<!--- table.cfm --->

<cfif THISTAG.ExecutionMode EQ "Start">
	<cfscript>
		param name="attributes.data";	// no type checking, just existence checking
		param name="attributes.headers"		type="boolean" default=false;
		param name="attributes.columnNames"	type="string";	// this'll be treated as a list
		
		currentRow = 1;
		
		// work out how we handle the data
		if (isQuery(attributes.data)){
			rows	= getSizeOfQuery(attributes.data);
			getRow	= getRowFromQuery;	// note that's a function REFERENCE, not a function CALL
		}else if (isArray(attributes.data)){
			rows	= getSizeOfArray(attributes.data);
			getRow	= getRowFromArray;
		}else{	// xml
			rows	= getSizeOfXml(attributes.data);
			getRow	= getRowFromXml;
		}
		headers = listToArray(attributes.columnNames);
		
		// grab any extra attributes, and treat them as attributes of the table tag
		otherAttributes = "";
		for (attribute in attributes){
			if (!listFindNoCase("data,headers,columnNames", attribute)){
				otherAttributes &= ' #lcase(attribute)#="#attributes[attribute]#"';
			}
		}
	</cfscript>
	<cfoutput><table #otherAttributes#></cfoutput>
	<cfif attributes.headers>
		<thead>
			<tr>
				<cfloop index="header" array="#headers#">
					<cfoutput><th>#header#</th></cfoutput>
				</cfloop>
			</tr>
		</thead>
	</cfif>
	<tbody>
	<cfset setCallerVars(attributes.data, currentRow, getRow, attributes.columnNames)>
<cfelse>	<!---end--->
	<cfset currentRow++>
	<cfif currentRow LE rows>
		<cfset setCallerVars(attributes.data, currentRow, getRow, attributes.columnNames)>
		<cfexit method="loop">
	<cfelse>
		</tbody></table>
		<cfexit method="exittag">
	</cfif>
</cfif>

	

<cfscript>
	// helper functions
	
	// we need to do this logic twice, so refactor it
	void function setCallerVars(data, row, getRow, columnNames){
		var rowData = getRow(data, row, columnNames);
		for (var col in listToArray(columnNames)){
			caller[col] = rowData[col];
		}
	}


	// how many rows
	numeric function getSizeOfQuery(q){
		return q.recordCount;
	}
	numeric function getSizeOfArray(a){
		return arrayLen(a);
	}
	numeric function getSizeOfXml(x){
		return arrayLen(xmlSearch(x, "/*/*"));
	}
	

	// get a row
	struct function getRowFromQuery(query q, numeric i){
		var row = {};
		for (var col in listToArray(q.columnList)){
			row[col] = q[col][i];
		}
		return row;
	}
	struct function getRowFromArray(array a, numeric i, string columnNames){
		var row = {};
		for (var col=1; col <= listLen(columnNames); col++){
			row[listGetAt(columnNames, col)] = a[i][col];
		}
		return row;
	}
	struct function getRowFromXml(xml x, numeric i){
		var row = {};
		var xmlRow = xmlSearch(x, "/*/*[#i#]");
		for (var col in xmlRow[1].xmlAttributes){
			row[col] = xmlRow[1].xmlAttributes[col];
		}
		return row;
	}
</cfscript>