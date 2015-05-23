<cfscript>

booleanVal = true;

 

httpSvc = new http();

httpSvc.setMethod("GET").setCharset("utf-8");

httpSvc.setUrl("http://#CGI.http_host#/rest/cyndi/MyHandler1/MyTest/#booleanVal#");

 

result = httpSvc.send().getPrefix();

writedump(result);

</cfscript>