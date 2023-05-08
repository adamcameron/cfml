<cfscript>
	testStr1	= "a1111";
	testStr2	= "b22222";
	
	regExp		= "^[A-Z][0-9]{4}$";
	
	writeOutput("testStr1: #reFindNoCase(regExp, testStr1)#<br />");
	writeOutput("testStr2: #reFindNoCase(regExp, testStr2)#<br />");
</cfscript>