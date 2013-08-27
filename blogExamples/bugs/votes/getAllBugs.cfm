<cfscript>
	bugbaseProxy = new VotedBugsBugbaseProxy();

	allBugs = bugbaseProxy.getBugs();
	jsonP = serializeJson(allBugs, true);
	json = reReplace(jsonP, "^//", "", "ONE");
	
	fileWrite(expandPath("./allBugs.json"), json);

	writeDump(json); 
	writeDump(allBugs); 
</cfscript>