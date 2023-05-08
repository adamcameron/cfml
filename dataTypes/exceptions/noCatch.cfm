<cfscript>
//noCatch.cfm

writeOutput("before try block<br>");
try {
	writeOutput("top of try<br>");
	fileHandle = fileOpen(getCurrentTemplatePath(), "UTF-8");
	writeOutput("bottom of try<br>");
}
finally{
	writeOutput("in finally<br>");
}
writeOutput("after try block<br>");
</cfscript>	