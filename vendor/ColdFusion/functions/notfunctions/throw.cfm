<cfscript>
// throw.cfm

structKeyExists(URL, "test")
	? writeOutput("Cheers for that")
	: throw(type="MissingParameterException", message="You need to pass a test parameter on the URL");
</cfscript>