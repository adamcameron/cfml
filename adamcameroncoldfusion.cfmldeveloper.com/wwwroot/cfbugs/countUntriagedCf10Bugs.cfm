<cfsetting showdebugoutput="false">
<cfscript>
	bugsUrl = "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=500&type=Bugs&product=1149&version=7770&state=OPEN&status=UNVR";
	bugUrl	= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	httpConnection = new Http(URL=bugsUrl, method="get");
	bugsJsonP = httpConnection.send().getPrefix().fileContent;
	bugsJson = removeChars(bugsJsonP, 1, 2);
	bugs = deserializeJson(bugsJson, false).query;

	try {
		statusUpdate = application.twitterService.createUpdateString("#dateFormat(now(), 'yyyy-mm-dd')# #timeFormat(now(), 'HH:MM')# Untriaged ColdFusion 10 bug count: #bugs.recordCount#. List: http://bit.ly/1c16LK7");
		application.twitterService.updateStatus(statusUpdate);
		message("#statusUpdate#");
	} catch (any e){
		message("Error setting status: #e.message# #e.detail#", "error");
	}
	
	function message(required string message, string type="info"){
		writeOutput(message & "<br />");
		writeLog(file="cfmlnotifier", text=message, type=type);
		if (type == "error"){
			application.mailService.send(to="cfmlnotifier@gmail.com", subject="ERROR processing bug", body=message);
		}		
	}
	application.mailService.send(to="cfmlnotifier@gmail.com", subject="STATUS", body="countUntriagedCf10Bugs.cfm completed @ #now()#");
</cfscript>