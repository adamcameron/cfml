<cfscript>
result = new Http(
	URL		= "http://#CGI.http_host#/rest/api/dataservice/todo/1/todo 1 description/todo 1 status",
	method	= "put"
).send().getPrefix();

writeDump(result);
</cfscript>