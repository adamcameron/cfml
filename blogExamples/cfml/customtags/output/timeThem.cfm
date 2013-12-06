<cfscript>
// timeThem.cfm
start = getTickCount();
include "callImplicitOutput.cfm";
elapsed = getTickCount() - start;
writeOutput("Execution time for implicitOutput test: #elapsed#<br>");
writeOutput("<hr>");

start = getTickCount();
include "callExplicitOutput.cfm";
elapsed = getTickCount() - start;
writeOutput("Execution time for explicitOutput test: #elapsed#<br>");
writeOutput("<hr>");

start = getTickCount();
include "callMinimalExplicitOutput.cfm";
elapsed = getTickCount() - start;
writeOutput("Execution time for minimalExplicitOutput test: #elapsed#<br>");
writeOutput("<hr>");
</cfscript>