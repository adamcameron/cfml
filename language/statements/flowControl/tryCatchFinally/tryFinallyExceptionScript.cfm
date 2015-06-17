<cfscript>
writeOutput("BEFORE<br/ >");
try {
	writeOutput("TRY<br/ >");
	throw(type="UncaughtException");
}
finally{
	writeOutput("FINALLY<br/ >");
}
writeOutput("AFTER<br/ >");
</cfscript>