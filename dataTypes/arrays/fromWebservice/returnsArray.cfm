<cfscript>
// returnsArray.cfm

webServicePath = CGI.script_name.listDeleteAt(CGI.script_name.listLen("/"), "/");
webServiceUri = webServicePath & "/WS.cfc?wsdl";

rainbow = createObject("webservice", "http://#CGI.http_host##webServiceUri#").returnsArray();

array = [];
writeOutput("Normal array class: #array.getClass().getName()#<br>");

writeOutput("Array returned from web service class: #rainbow.getClass().getName()#<br>");
writeDump(rainbow);
</cfscript>
