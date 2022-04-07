<cfscript>
	q = queryNew("col1", "CF_SQL_VARCHAR");
	queryAddRow(q);
	querySetCell(q, "col1", javacast("String", " 02"));

	j = serializeJson(q);
	writeOutput(j);
</cfscript>
