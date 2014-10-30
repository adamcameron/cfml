<cfscript>
/*
	data = queryNew("id,data", "integer,varchar",[
		[1, "tahi"],
		[2, "rua"],
		[3, "toru"],
		[4, "wha"]
	]);

	json = serializeJson(data);
	writeOutput(json);
*/
	json = '{"COLUMNS":["ID","COL with space"],"DATA":[[1,"tahi"],[2,"rua"],[3,"toru"],[4,"wha"]]}';
	records = deserializeJson(json, false);
	writeDump(records);

	row = queryGetRow(records, 6);
	writeDump(row);
</cfscript>