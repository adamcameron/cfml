<cfscript>
	result.query[1] = queryNew("");
	queryAddColumn(result.query[1], "dateCol", "Date", [now()]);
	result.query[2] = serializeJson(result.query[1]);
	result.query[3] = deserializeJson(result.query[2]);


	result.struct[1] = {
		date = now()
	};
	result.struct[2] = serializeJson(result.struct[1]);
	result.struct[3] = deserializeJson(result.struct[2]);

	result.array[1] = [now()];
	result.array[2] = serializeJson(result.array[1]);
	result.array[3] = deserializeJson(result.array[2]);

	writeDump(result);
</cfscript>