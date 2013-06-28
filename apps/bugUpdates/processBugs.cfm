<cfsetting showdebugoutput="false" requesttimeout="#60*60*24#">
<cfflush interval="16">
<cfscript>
	application.mailService.send(to="cfbugnotifier@gmail.com", subject="STATUS", body="bugUpdates/processBugs.cfm started @ #now()#");

	allBugs = application.bugbaseProxy.getBugs();
	message("Processing #allBugs.recordCount# bugs");
	for (i=1; i <= allBugs.recordCount; i++){
		bugId		= allBugs.AD_S_DEFECT_ID[i];
		bugVersion	= allBugs.version[i];

		message("Processing #bugId#");

		// get Adobe's version of this bug (we either need to add it to our DB, or use it to check for updates)
		adobeBug = application.bugbaseProxy.getBug(bugId);

		localBug = entityLoad("AdobeBug", bugId, true);

		if (isNull(localBug)){
			message("#bugId# not found in local DB: adding");

			localBug = new components.orm.AdobeBug();
			localBug.setAdobeId(bugid);
			localBug.setTitle(adobeBug.title);
			localBug.setStatus(adobeBug.status);
			localBug.setState(adobeBug.state);
			localBug.setComments(adobeBug.comments);
			localBug.setAttachments(adobeBug.attachments);
			localBug.setVotes(adobeBug.votes);
			localBug.setVersion(bugVersion);
			entitySave(localBug);
			ormFlush();
			message("#bugId# added to local DB");
		}else{
			message("#bugId# found in local DB: checking for updates");

			updateStatus = "";
			if (adobeBug.status != localBug.getStatus()){
				updateStatus = "Status changed";
				localBug.setStatus(adobeBug.status);
			}else if (adobeBug.state != localBug.getState()){
				updateStatus = "Sub-status changed";
				localBug.setState(adobeBug.state);
			}else if (adobeBug.comments != localBug.getComments()){
				updateStatus = "Comment added";
				localBug.setComments(adobeBug.comments);
			}else if (adobeBug.votes != localBug.getVotes()){
				updateStatus = "Vote added";
				localBug.setVotes(adobeBug.votes);
			}else if (adobeBug.attachments != localBug.getAttachments()){
				updateStatus = "Attachment added";
				localBug.setAttachments(adobeBug.attachments);
			}
			if (len(updateStatus)){
				message("#bugId# updated: #updateStatus#");

				entitySave(localBug);
				ormFlush();

				bugUrl = application.bugbaseProxy.getBugUrl(bugid);
				shortenedUrl = application.bitlyService.shorten(bugUrl);
				statusUpdate = application.twitterService.createUpdateString("#uCase(updateStatus)#: #bugid# (#bugVersion#) #adobeBug.title#", shortenedUrl);
try {
				application.twitterService.updateStatus(statusUpdate);
}
catch (any e){
	writeDump(e);
	abort;
}
				application.mailService.send(to="cfbugnotifier@gmail.com", subject="STATUS", body="#statusUpdate# @ #now()#");
				message("TWITTER STATUS UPDATED: #statusUpdate#");

			}else{
				message("#bugId# unchanged");
			}
		}

	}

	function message(required string message, string type="info"){
		writeOutput("#timeFormat(now(), 'HH:MM:SS.LLL')# #message#<br />");
		writeLog(file="cfBugUpdates", text=message, type=type);
		if (type == "error"){
			application.mailService.send(to="cfbugnotifier@gmail.com", subject="ERROR processing bug", body=message);
		}
	}
	application.mailService.send(to="cfbugnotifier@gmail.com", subject="STATUS", body="bugUpdates/processBugs.cfm completed @ #now()#");
</cfscript>