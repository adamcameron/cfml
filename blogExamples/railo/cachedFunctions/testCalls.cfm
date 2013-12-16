<cfscript>
// testCalls.cfm
writeOutput("<h3>#message#</h3>");
writeOutput("Called at: #ts()#<br>");
writeOutput(heavyLifting(label="first"));
sleep(1000);
writeOutput("Called at: #ts()#<br>");
writeOutput(heavyLifting(label="second"));
sleep(1000);
</cfscript>