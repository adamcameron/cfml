<cfscript>
	allBugs = deserializeJson(fileRead(expandPath("./allBugs.json")), false);

	query = new Query(sql="SELECT * FROM allBugs WHERE DEFID > 3506757-1000 AND DEFID < 3506757+1000", dbtype="query");
	query.setAttributes(allBugs = allBugs);
	result = query.execute().getResult();

	fileWrite(expandPath("./someBugs.json"), serializeJson(result, true));
	bugsJsonP = fileRead(expandPath("./someBugs.json"));
	bugsJson = reReplace(bugsJsonP, "^//", "", "ONE");
	someBugs = deserializeJson(bugsJson, false);
	writeDump(someBugs);
</cfscript>