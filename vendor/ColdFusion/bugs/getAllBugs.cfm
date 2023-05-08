<cfscript>
	bugsUrl		= "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=1000&product=1149&version={VERSION}&state=OPEN";
	bugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	versions	= {
		"10.0.0"	= 7770,
		"9.0.1"		= 9288,
		"9.0.0"		= 9289,
		"8.0.1"		= 9290,
		"8.0.0"		= 9291
	};
	bugs = queryNew("");

	for (version in versions){
		versionUrl = replace(bugsUrl, "{VERSION}", versions[version], "one");
		versionBugsJson = new Http(url=versionUrl, method="get").send().getPrefix().fileContent;
		versionBugs = deserializeJson(replace(versionBugsJson, "//", "", "one"), false).query;

		if (!len(bugs.columnList)){
			bugs = versionBugs;
		}else{
			bugs = new Query(dbtype="query", bugs=bugs, versionBugs=versionBugs, sql="SELECT * FROM bugs UNION ALL SELECT * FROM versionBugs").execute().getResult();
		}
	}

	json = serializeJson(bugs, true);
	fileWrite(expandPath("./allBugs.json"), json);
abort;
writeDump(var=bugs, top=10);
abort;
	while (bugs.next()){
		bugJson = new Http(url=bugUrl & bugs.AD_S_DEFECT_ID[bugs.currentRow], method="get").send().getPrefix().fileContent;
	}


</cfscript>
