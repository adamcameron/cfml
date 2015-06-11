<cfscript>
	oHttp = new Http(
		method	= "get",
		url		= "http://localhost:8500/rest/testAppRestApi/Person/getPerson/Frances/Allan"
	);
	oHttp.addParam(type="header", name="accept", value="text/plain");
	stResult = oHttp.send().getPrefix();

	writeDump(stResult);
	writeOutput(stResult.fileContent);

	writeOutput("<hr />");

	oHttp = new Http(
		method	= "get",
		url		= "http://localhost:8500/rest/testAppRestApi/Person/getPerson/Frances/Allan"
	);
	oHttp.addParam(type="header", name="accept", value="text/xml");
	stResult = oHttp.send().getPrefix();

	writeDump(stResult);
	writeOutput(stResult.fileContent);
</cfscript>
