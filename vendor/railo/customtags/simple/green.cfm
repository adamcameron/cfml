<cfscript>
	if (thisTag.executionMode == "end") {
		writeOutput('<span style="color:green">#thistag.generatedContent#</span>');
		thistag.generatedContent = "";
	}
</cfscript>