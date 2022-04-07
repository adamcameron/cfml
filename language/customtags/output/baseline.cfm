<cfscript>
	if (thistag.executionMode == "START"){
		writeOutput(thistag.generatedContent);
		thistag.generatedcontent = "";
	}
</cfscript>