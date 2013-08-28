<cfflush interval="16">
<cfscript>
	bugbaseProxy = new shared.git.apps.bugUpdates.components.BugbaseProxy();
	
	bugsFile = expandPath("./filteredBugs.json");
	
	bugsToUpdate = deserializeJson(fileRead(bugsFile), false);

	try {
		while (bugsToUpdate.next()){
			i = bugsToUpdate.currentRow;
			bug = bugbaseProxy.getBug(bugsToUpdate.AD_S_DEFECT_ID[i]);
			querySetCell(bugsToUpdate, "version", bug.version, i);
			querySetCell(bugsToUpdate, "votes", bug.votes, i);
			
			writeOutput("#i#/#bugsToUpdate.recordCount# #bugsToUpdate.AD_S_TITLE[i]#: #bugsToUpdate.VERSION[i]# (#bugsToUpdate.VOTES[i]#)<br>");
			if (!i mod 50){
				fileWrite(bugsFile, serializeJson(bugsToUpdate, true));
				writeOutput("Work saved<br>");
			}
		}
	}
	catch (any e){
		writeDump(var=e, expand=false);
		fileWrite(bugsFile, serializeJson(bugsToUpdate, true));
		writeOutput("Work saved");
	}
</cfscript>