<cfsetting requesttimeout="1800">
<cfflush interval="16">
<cfscript>
	bugbaseProxy = new BugbaseProxy();

	notFixedBugsWithVotesColumn = expandPath("./notFixedBugsWithVotesColumn.json");
	notFixedBugsWithVotesColumnPopulated = expandPath("./") & "notFixedBugsWithVotesColumnPopulated.json";

	bugsToUpdate = deserializeJson(fileRead(notFixedBugsWithVotesColumn), false);

	try {
		while (bugsToUpdate.next()){
			i = bugsToUpdate.currentRow;
			bug = bugbaseProxy.getBug(bugsToUpdate.AD_S_DEFECT_ID[i]);
			querySetCell(bugsToUpdate, "votes", bug.votes, i);

			writeOutput("#i#/#bugsToUpdate.recordCount# #bugsToUpdate.AD_S_TITLE[i]#: #bugsToUpdate.VERSION[i]# (#bugsToUpdate.VOTES[i]#)<br>");
			if (!i mod 50){
				fileWrite(notFixedBugsWithVotesColumnPopulated, serializeJson(bugsToUpdate, true));
				writeOutput("Work saved<br>");
			}
		}
		writeOutput("Finished processing query<br>");
	}
	catch (any e){
		writeDump(var=e, expand=false);
		fileWrite(notFixedBugsWithVotesColumnPopulated, serializeJson(bugsToUpdate, true));
		writeOutput("Work saved");
	}
</cfscript>