<cfscript>
result = new Http(
	URL		= "#CGI.http_host#/rest/api/dataservice/todos",
	method	= "get"
).send().getPrefix();

writeDump(result);
</cfscript>