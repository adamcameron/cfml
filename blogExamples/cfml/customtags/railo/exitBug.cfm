<cfscript>
// exitBug.cfm
param attributes.exitmethod="";

writeOutput("thistag.executionMode: [#thistag.executionMode#]<br>");

if (thistag.executionMode == "start"){
	writeOutput("We don't need to do anything in the start tag, so exiting<br>");

	if (len(attributes.exitMethod)){
		writeOutput("exitMethod: [#attributes.exitmethod#]<br>");
		exit attributes.exitmethod;
	}

	writeOutput("exitMethod: [none specified]<br>");
	exit;
}

writeOutput("processing the end tag<br>");
writeOutput("thisTag.generatedContent: [#thisTag.generatedContent#]<br>");
</cfscript>