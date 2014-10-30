<cfscript>
// nullcoalescingShortCircuit.cfm
function defaulter(){
	writeOutput("defaulter() was called<br>");
	return "default";
}

result = URL.param ?: defaulter();
writeOutput("Value of result: [#result#]<br>");
</cfscript>