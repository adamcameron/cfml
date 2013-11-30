<cfscript>
// testAbortInFunction.cfm
writeOutput("Top of testAbortInFunction.cfm<br>");
o = new Test();
o.testAbort();
writeOutput("Bottom of testAbortInFunction.cfm<br>");
</cfscript>