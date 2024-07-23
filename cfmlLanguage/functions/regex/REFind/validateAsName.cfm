<cfscript>
	testStr = "terrence o'leary-williams";
	regExp1 = "^[^-' ]{1}[-' [:alpha:]]+[^-' ]{1}$";
//	regExp1 = "^[[:alpha:]]+[-' ][[:alpha:]]+$";
	writeOutput(reFind(regExp1, testStr));
</cfscript>