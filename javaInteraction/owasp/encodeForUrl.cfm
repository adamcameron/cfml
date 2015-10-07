<cfscript>
encoder = createObject("java", "org.owasp.esapi.reference.DefaultEncoder").getInstance();	

unencodedString = "encode this please";
encodedString = encoder.encodeForUrl(unencodedString);

writeDump([
	unencodedString,
	encodedString
]);
</cfscript>