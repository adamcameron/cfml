<cfflush interval="16">
<cfscript>
	bugbaseProxy = new components.BugbaseProxy();

	allBugs = deserializeJson(fileRead(expandPath("./allBugs.json")));

	for (bugId in allBugs.data.AD_S_DEFECT_ID){
		writeOutput("Processing #bugId#&hellip;<br>");

		bug = entityLoad("AdobeBug", bugId, true);
		if (!isNull(bug)){
			writeOutput("Already loaded<br>");
			continue;
		}
		
		bugData = bugbaseProxy.getBug(bugId);

		bug = new components.orm.AdobeBug(
			adobeId		= bugId,
			title		= bugData.title,
			status		= bugData.status,
			state		= bugData.state,
			comments	= bugData.comments,
			attachments	= bugData.attachments,
			votes		= bugData.votes
		);
		writeOutput("Bug found: '#bugData.title#'<br>");
		entitySave(bug);
		ormFlush();
		writeOutput("Bug saved<br>");
		sleep(2000);
	}
</cfscript>