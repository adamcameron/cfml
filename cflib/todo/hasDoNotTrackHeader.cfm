<cfscript>
function hasDoNotTrackHeader() {
	var requestHeaders = getHttpRequestData().headers;
	return structKeyExists(requestHeaders, "DNT") && requestHeaders.DNT == 1;
}

writeOutput(hasDoNotTrackHeader());	
</cfscript>