<cfscript>
result = new Http(
	URL		= "http://#CGI.http_host#/rest/api/dataservice/greet/",
	method	= "get"
).send().getPrefix();

writeDump(result);
</cfscript>