<cfflush interval="16">
<cfscript>
	application.mailService.send(to="cfmlnotifier@gmail.com", subject="STATUS", body="processBugs.cfm started @ #now()#");

	lastBugProcessed = application.adobeBugService.getLastBugProcessed();
	message("Last bug processed: #lastBugProcessed#");

	bugs = application.adobeBugService.getBugs(since=lastBugProcessed);
	message("New bugs to process: #bugs.recordCount#");
	
	for (row=1; row <= bugs.recordCount; row++){
		try {
			shortenedUrl = application.bitlyService.shorten(bugs.bugUrl[row]);
			statusUpdate = application.twitterService.createUpdateString("#bugs.id[row]# (#bugs.product[row]# #bugs.version[row]#) #bugs.title[row]#", shortenedUrl);
			application.twitterService.updateStatus(statusUpdate);
			message("#statusUpdate#");
			application.adobeBugService.setLastBugProcessed(bugs.id[row]);
		} catch (any e){
			
			message("Error setting status: #e.message# #e.detail#", "error");
		}
	}
	
	function message(required string message, string type="info"){
		writeOutput(message & "<br />");
		writeLog(file="cfmlnotifier", text=message, type=type);
		if (type == "error"){
			application.mailService.send(to="cfmlnotifier@gmail.com", subject="ERROR processing bug", body=message);
		}		
	}
	application.mailService.send(to="cfmlnotifier@gmail.com", subject="STATUS", body="processBugs.cfm completed @ #now()#");
</cfscript>