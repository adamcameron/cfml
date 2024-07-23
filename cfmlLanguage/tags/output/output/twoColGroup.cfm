<cfscript>
	q = queryNew("col1,col2,col3");
	queryAddRow(q); querySetCell(q, "col1", 1); querySetCell(q, "col2", "a"); querySetCell(q, "col3", "apple");
	queryAddRow(q); querySetCell(q, "col1", 1); querySetCell(q, "col2", "a"); querySetCell(q, "col3", "asparagus");
	queryAddRow(q); querySetCell(q, "col1", 2); querySetCell(q, "col2", "a"); querySetCell(q, "col3", "Angela");
	queryAddRow(q); querySetCell(q, "col1", 2); querySetCell(q, "col2", "b"); querySetCell(q, "col3", "bacon");
	queryAddRow(q); querySetCell(q, "col1", 2); querySetCell(q, "col2", "b"); querySetCell(q, "col3", "banana");
	queryAddRow(q); querySetCell(q, "col1", 3); querySetCell(q, "col2", "c"); querySetCell(q, "col3", "cherry");
	queryAddRow(q); querySetCell(q, "col1", 4); querySetCell(q, "col2", "d"); querySetCell(q, "col3", "Donna");
</cfscript>

<cfoutput query="q" group="col1,col2">
	[#currentRow#] (OUTER)<br />
	<cfoutput>
		[#currentRow#] (INNER)<br />
	</cfoutput>
</cfoutput>