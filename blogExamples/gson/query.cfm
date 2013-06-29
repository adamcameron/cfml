<cfscript>
	include "../json/createRecords.cfm";

	gson = createObject("java", "com.google.gson.Gson");
	writeDump(records);
	try {
		json = gson.toJson();
		writeDump([records,json]);
	}
	catch (any e){
		writeDump(e);
	}

</cfscript>
