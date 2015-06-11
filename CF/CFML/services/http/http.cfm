<cfscript>
	oHttp = new http();
	oHttp.setAttributes(url="http://www.cricket.org", method="get");
	oHttp.send();

	dump(var=oHttp);
</cfscript>