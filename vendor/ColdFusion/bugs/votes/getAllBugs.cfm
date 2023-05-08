<cfscript>
	bugbaseProxy = new VotedBugsBugbaseProxy();

	allVotedBugs = bugbaseProxy.getBugs();
	jsonP = serializeJson(allVotedBugs, true);
	json = reReplace(jsonP, "^//", "", "ONE");

	fileWrite(expandPath("./allVotedBugs.json"), json);

	writeDump(json);
	writeDump(allVotedBugs);
</cfscript>