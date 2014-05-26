<cfscript>
	o = new C();

	writeOutput("<h3>Output not specified:</h3>");
	o.outputNotSpecififed();
	writeOutput("<hr>");

	writeOutput("<h3>Output true:</h3>");
	o.outputIsTrue();
	writeOutput("<hr>");

	writeOutput("<h3>Output false:</h3>");
	o.outputIsFalse();
	writeOutput("<hr>");
</cfscript>