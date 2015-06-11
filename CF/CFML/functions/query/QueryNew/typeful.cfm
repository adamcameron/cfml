<cfscript>
	q = queryNew("intData", "integer");
	queryAddRow(q);
	querySetCell(q, "intData", "not an integer");
	q.intData[1] = "not an integer";
	writeDump(q);	
</cfscript>