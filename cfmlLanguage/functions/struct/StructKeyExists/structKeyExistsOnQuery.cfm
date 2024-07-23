<cfscript>
	q = queryNew("col1");
	queryAddRow(q);	querySetCell(q, "col1", "val1");
	queryAddRow(q);	querySetCell(q, "col1", "val2");
	queryAddRow(q);	querySetCell(q, "col1", "val1");
</cfscript>

<cfoutput>
	structKeyExists(q, "col1"): [#structKeyExists(q, "col1")#]<br />
	structKeyExists(q, "col2"): [#structKeyExists(q, "col2")#]<br />
<cfdump var="#structFindValue(q, 'val1', 'all')#">
</cfoutput>