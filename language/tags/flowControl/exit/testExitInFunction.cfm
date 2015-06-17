<cfscript>
// testExitInFunction.cfm
writeOutput("Top of testExitInFunction.cfm<br>");
o = new Test();
o.testExit();
writeOutput("Bottom of testExitInFunction.cfm<br>");
</cfscript>