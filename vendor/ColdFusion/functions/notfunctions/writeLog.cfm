<cfscript>
// writeLog.cfm
structKeyExists(URL, "test")
	? writeLog("Received #URL.test#")
	: writeOutput("Oi. Where's the test attribute?");
</cfscript>