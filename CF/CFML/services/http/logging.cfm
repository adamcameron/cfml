<cfscript>
	oHttp = new http(url="http://www.imdb.com", method="get");
	
	oHttp2 = oHttp.send();

	stHttp = oHttp2.getResult();
	writeDump(variables);
</cfscript>