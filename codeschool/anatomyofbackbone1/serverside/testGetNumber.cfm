<cfscript>
result = new Http(
	URL		= "#CGI.http_host#/rest/api/dataservice/getnumber/#URL.id#",
	method	= "get"
).send().getPrefix();

writeDump(result);
</cfscript>