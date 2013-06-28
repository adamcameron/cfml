<cfscript>
	struct = {foo="bar"};

	gson = createObject("java", "com.google.gson.Gson");

	json = gson.toJson(struct);

	writeDump([struct,json]);
</cfscript>