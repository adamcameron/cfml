<cfscript>
// testBothTypesViaExpressions.cfm

o = new BothTypesViaExpressions();

writeOutput("Call public method:<br>");
o.f();
writeOutput("<hr>");

writeOutput("Call both methods via proxy:<br>");
o.proxy();
</cfscript>