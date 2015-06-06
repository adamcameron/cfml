<cfscript>
	colours = queryNew("id,english,maori");
	q = queryNew("id,english,maori");
	
	queryAddRow(colours);
	querySetCell(colours, "id", 1);
	querySetCell(colours, "english", "red");
	querySetCell(colours, "maori", "whero");
/*
	queryAddRow(colours);
	querySetCell(colours, "id", 2);
	querySetCell(colours, "english", "gold");
*/
	queryAddRow(colours);
	querySetCell(colours, "id", 3);
	querySetCell(colours, "english", "green");
	querySetCell(colours, "maori", "kakariki");
	
	gson = createObject("java", "com.google.gson.Gson");
	
	json = gson.toJson(colours);
	
	result = gson.fromJson(json, q.getClass());
	
	writeDump(variables);
</cfscript>