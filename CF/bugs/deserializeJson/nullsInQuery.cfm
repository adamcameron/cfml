<cfscript>
	colours = queryNew("id,english,maori");
	queryAddRow(colours);
	querySetCell(colours, "id", 1);
	querySetCell(colours, "english", "red");
	querySetCell(colours, "maori", "whero");

	queryAddRow(colours);
	querySetCell(colours, "id", 2);
	querySetCell(colours, "english", "gold");

	queryAddRow(colours);
	querySetCell(colours, "id", 3);
	querySetCell(colours, "english", "green");
	querySetCell(colours, "maori", "kakariki");
	
	json = serializeJson(colours, true);
	
	result = deserializeJSON(json, false);
	
	writeDump(variables);
</cfscript>