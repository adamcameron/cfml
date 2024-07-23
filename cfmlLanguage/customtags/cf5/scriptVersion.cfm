<cfscript>
// scriptVersion.cfm
param attributes.exitMethod="";

writeOutput("executionMode: #thisTag.executionMode#<br>");
if (thisTag.executionMode == "start"){
	if (len(attributes.exitMethod)){
		writeOutput("exitMethod: #attributes.exitMethod#<br>");
		exit attributes.exitMethod;
	}else{
		writeOutput("exitMethod: not specified<br>");
		exit;
	}
}
</cfscript>