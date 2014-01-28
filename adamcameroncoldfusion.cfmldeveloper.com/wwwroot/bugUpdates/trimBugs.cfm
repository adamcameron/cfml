<cfscript>
	allBugs = deserializeJson(fileRead(expandPath("./allBugs.json")), false);

	query = new Query(sql="SELECT * FROM allBugs WHERE AD_S_DEFECT_ID > 3506757-1000 AND AD_S_DEFECT_ID < 3506757+1000", dbtype="query");
	query.setAttributes(allBugs = allBugs);
	result = query.execute().getResult();

	fileWrite(expandPath("./someBugs.json"), serializeJson(result, true));
	bugsJsonP = fileRead(expandPath("./someBugs.json"));
	bugsJson = reReplace(bugsJsonP, "^//", "", "ONE");
	someBugs = deserializeJson(bugsJson, false);
	writeDump(someBugs);
</cfscript>