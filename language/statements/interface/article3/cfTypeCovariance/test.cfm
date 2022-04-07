<cfscript>
	// test.cfm
	try {
		o = new ReturnsString();
	} catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
	writeOutput("<hr>");

	try {
		o = new PassesString();
	} catch (any e){
		writeOutput("#e.message# #e.detail#<br>");
	}
</cfscript>