<cfscript>
	stValues = request.getCacheProperties();
	writeDump(stValues);
	
	request.setCacheProperties(argumentCollection={MaxCachedQuery=1000000});

	stValues = request.getCacheProperties();
	writeDump(stValues);

</cfscript>