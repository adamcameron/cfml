<cfscript>
	// testUsingFunctionExpressions.cfm
	o = new UsingFunctionExpressions();

	o.setMyProperty("from calling code");
	writeOutput("<hr>");
	
	o.runThemAll("from runThemAll()");
</cfscript>