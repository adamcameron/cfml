<cfscript>
// mail.cfm
if (thistag.executionMode == "END"){
	writeOutput(thistag.generatedContent);
	thistag.generatedContent = "";
}
</cfscript>