<cfscript>
// tag.cfm
if (thisTag.executionMode == "end"){
	writeOutput("<strong>#trim(thisTag.generatedContent)#</strong>");
	thisTag.generatedContent = "";
}
</cfscript>