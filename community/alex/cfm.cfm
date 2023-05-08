<cfscript>
requestData = GetHttpRequestData();
requestUrl  = requestData.headers['X-Original-URL'] ?: server.coldfusion.productVersion;

writeOutput(requestUrl);
</cfscript>
