<cfflush interval="16">
<cfscript>
logName = "deferTest116_#listFirst(getFileFromPath(getBaseTemplatePath()), '.')#";

function ts(){
	return timeFormat(now(), "H:MM:SS.LLL");
}	

function dumpLog(){
	sleep(2000); // give the thread time to finish, and the log time to write
	var text = fileRead("#server.coldfusion.rootdir#/logs/#logName#.log");
	writeOutput("<pre>#text#</pre>");
}

include "./defaultHandlers.cfm";
include "./defer.cfm";
</cfscript>