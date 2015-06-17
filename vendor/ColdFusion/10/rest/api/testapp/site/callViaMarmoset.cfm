<cfscript>
	oHttp = new Http(
		method	= "get",
		url		= "http://localhost:8500/rest/testAppRestApi/Basic/ping/?message=banjo"
	);
	oHttp.addParam(type="header", name="accept", value="text/plain");
	oHttp.addParam(type="header", name="content-type", value="text/plain");
	stResult = oHttp.send().getPrefix();

	writeDump(stResult);
	writeOutput(stResult.fileContent);

	oHttp = new Http(
		method	= "get",
		url		= "http://localhost:8500/marmoset/testAppRestApi/Basic/ping/"
	);
	oHttp.addParam(type="header", name="accept", value="text/plain");
	oHttp.addParam(type="header", name="content-type", value="text/plain");
	oHttp.addParam(type="url", name="message", value="ECHO #createUuid()#");
	stResult = oHttp.send().getPrefix();

	writeDump(stResult);
	writeOutput(stResult.fileContent);
</cfscript>
