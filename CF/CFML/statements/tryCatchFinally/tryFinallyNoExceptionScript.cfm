<cfscript>
writeOutput("BEFORE<br/ >");
try {
	writeOutput("TRY<br/ >");
}
finally{
	writeOutput("FINALLY<br/ >");
}
writeOutput("AFTER<br/ >");
</cfscript>