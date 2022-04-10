<cfscript>
// minimalExplicitOutput.cfm
if (thistag.executionMode == "START"){
	param string attributes.returnVariable="minimalExplicitOutput";
}else{
	caller[attributes.returnVariable] = thistag.generatedContent;
	thistag.generatedContent = "";
}
</cfscript>