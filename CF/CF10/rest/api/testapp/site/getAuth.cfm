<cfscript>
	oHttp = new Http(
		method	= "get",
		url		= "http://localhost:8500/rest/testAppRestApi/Secure/getAuth/"
	);
	oHttp.addParam(type="cookie", name="CFID", value=cookie.cfid);
	oHttp.addParam(type="cookie", name="CFTOKEN", value=cookie.cftoken);
	stResult = oHttp.send().getPrefix();

	writeDump(stResult);
	writeOutput(stResult.fileContent);
</cfscript>
