<cfsetting requesttimeout="1800">
<cfflush interval="16">
<cfscript>
	bugbaseProxy = new BugbaseProxy();

	notFixedBugsWithVotesColumn = expandPath("./notFixedBugsWithVotesColumn.json");

	bugsToUpdate = deserializeJson(fileRead(notFixedBugsWithVotesColumn), false);

	while (bugsToUpdate.next()){
		i = bugsToUpdate.currentRow;
		writeOutput("#i#/#bugsToUpdate.recordCount# #bugsToUpdate.AD_S_TITLE[i]#: #bugsToUpdate.VERSION[i]#<br>");
	}
</cfscript>