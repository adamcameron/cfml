<cfsetting showdebugoutput="false">
<cfscript>
	cfVersions = [9288,9289];

	bugsUrlTemplate = "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=500&type=Bugs&product=1149&version={VERSION}&state=OPEN&status=UNVR";
	bugUrl	= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	for (cfVersion in cfVersions){
		bugsUrl = replaceNoCase(bugsUrlTemplate, "{version}", cfVersion, "ONE");
		httpConnection = new Http(URL=bugsUrl, method="get");
		bugsJsonP = httpConnection.send().getPrefix().fileContent;
		bugsJson = removeChars(bugsJsonP, 1, 2);
		bugs = deserializeJson(bugsJson, false).query;
		param query allBugs = queryNew(bugs.columnList);
		param string typedColumnList = reReplace(allBugs.columnList, "(\w+)" ,"CAST(\1 AS VARCHAR) AS \1", "ALL");
		allBugs = new Query(allBugs=allBugs, bugs=bugs, dbtype="query", sql="SELECT #typedColumnList# FROM allBugs UNION ALL SELECT #typedColumnList# FROM bugs").execute().getResult();
	}

	try {
		statusUpdate = application.twitterService.createUpdateString("#dateFormat(now(), 'yyyy-mm-dd')# #timeFormat(now(), 'HH:MM')# Untriaged ColdFusion 9.x bug count: #allBugs.recordCount#. List: http://bit.ly/KiNIPt");
		application.twitterService.updateStatus(statusUpdate);
		message("#statusUpdate#");
	} catch (any e){
		message("Error setting status: #e.message# #e.detail#", "error");
	}
	
	function message(required string message, string type="info"){
		writeOutput(message & "<br />");
		writeLog(file="cfBugNotifier", text=message, type=type);
		if (type == "error"){
			application.mailService.send(to="cfbugnotifier@gmail.com", subject="ERROR processing bug", body=message);
		}		
	}
	application.mailService.send(to="cfbugnotifier@gmail.com", subject="STATUS", body="countUntriagedCf9Bugs.cfm completed @ #now()#");
</cfscript>