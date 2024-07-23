<cfscript>
// elvis.cfm

writeOutput("Elvis when using false: ");
testVar  = false;
writeOutput(testVar ?: "default");
writeOutput("<br>");

function nuller(){}

writeOutput("Elvis when using null: ");
writeOutput(nuller() ?: "default");
writeOutput("<br>");
</cfscript>