<cfscript>
thisDir = getDirectoryFromPath(getCurrentTemplatePath());
start=getTickCount();
cfhtmltopdf(destination="#thisDir#result.pdf", overwrite=true){
	writeOutput(fileRead("#thisDir#table.html"));
}
writeOutput("Processing time: #getTickCount()-start#ms<br>");
</cfscript>