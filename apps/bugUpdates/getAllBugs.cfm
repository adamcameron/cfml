<cfscript>
	bugbaseProxy = new components.BugbaseProxy();

	allBugs = bugbaseProxy.getBugs();

	fileWrite(expandPath("./allBugs.json"), serializeJson(allBugs, true));

	writeDump(allBugs); 
</cfscript>