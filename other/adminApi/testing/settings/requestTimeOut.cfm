<cfscript>
	stOriginal	= request.getRuntimeProperties();
	writeDump(var=stOriginal, label="Before");
abort;	
	stArgs = {
		"TimeoutRequests"			= true,
		"TimeoutRequestTimeLimit"	= 180
	};
	request.setRuntimeProperties(argumentCollection=stArgs);

	stNew = request.getRuntimeProperties();
	writeDump(var=stNew, label="After");
</cfscript>