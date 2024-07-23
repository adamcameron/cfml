<cfscript>
	bugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	bugsJson = fileRead(expandPath("./allBugs.json"));
	bugs = deserializeJson(bugsJson);
writeDump(var=bugs, top=10);
abort;


	while (bugs.next()){
		bugJson = new Http(url=bugUrl & bugs.AD_S_DEFECT_ID[bugs.currentRow], method="get").send().getPrefix().fileContent;
	}


</cfscript>
