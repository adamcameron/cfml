<cfscript>
writeLog(file="testNoCommas" text="Testing writeLog() with no commas");
logData = fileRead(server.coldfusion.rootDir & "/logs/testNoCommas.log");
writeOutput("<pre>#logData#</pre>");
</cfscript>