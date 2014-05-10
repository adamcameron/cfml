<cfsetting showdebugoutput="false">
<cfscript>
	param name="URL.name" default="";

	bugsUrl = "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=500&product=1149&reportedBy=#URL.name#";

	httpConnection = new Http(URL=bugsUrl, method="get");
	bugsJsonP = httpConnection.send().getPrefix().fileContent;
	bugsJson = removeChars(bugsJsonP, 1, 2);
	writeOutput(bugsJson);
</cfscript>