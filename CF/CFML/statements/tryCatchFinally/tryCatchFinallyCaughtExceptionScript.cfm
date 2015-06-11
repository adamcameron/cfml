<cfscript>
writeOutput("BEFORE<br/ >");
try {
	writeOutput("TRY<br/ >");
	throw(type="CaughtException");
}
catch ("CaughtException" e){
	writeOutput("CAUGHT<br />");
}
finally{
	writeOutput("FINALLY<br/ >");
}
writeOutput("AFTER<br/ >");
</cfscript>