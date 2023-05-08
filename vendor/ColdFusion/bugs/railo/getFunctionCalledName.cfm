<cfscript>
function callMe(required string actual){
	writeOutput("when calling #actual#(), getFunctionCalledName() returns: #getFunctionCalledName()#<br>");
}

functionRef = callMe;

callMe("callme");
functionRef("functionRef");
</cfscript>