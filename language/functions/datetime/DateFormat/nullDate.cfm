<cfscript>
	q = queryNew("col1", "cf_sql_date");
	queryAddRow(q);
//	querySetCell(q, "col1", "");

	writeOutput("[#dateFormat(q.col1[1], 'yyyy-mm-dd')#]");
</cfscript>