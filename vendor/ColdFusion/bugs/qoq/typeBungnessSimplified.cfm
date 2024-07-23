<cfscript>
	records = queryNew("id,version", "integer,varchar");
	queryAddRow(records);
	querySetCell(records, "id", "integer", i);
	querySetCell(records, "version", "9.0.2");

	writeDump(records);
</cfscript>