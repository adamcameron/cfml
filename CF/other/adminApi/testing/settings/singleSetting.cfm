<cfscript>
	//stArgs = {"TemplateCacheSize"="1025"};
	stArgs = {
		"LogDirectory"	= "C:\temp\",	// C:\Adobe\JRun4\servers\cf9b2\cfusion-ear\cfusion-war\WEB-INF\cfusion\logs
		"MaxFileSize"			= "5001",
		"MaxArchives"			= "11",
		"LogCorbaCalls"			= "true",
		"LogRequestTimeLimit"	= "31",
		"LogScheduledTask"		= "true"
	};
	
	writeDump(var=stArgs, label="stArgs");

	//request.setRuntimeProperties(argumentCollection=stArgs);
	//request.setScopeProperties(argumentCollection=stArgs);
	//request.setCacheProperties(argumentCollection=stArgs);
	//request.setMailProperties(argumentCollection=stArgs);
	request.setLogProperties(argumentCollection=stArgs);
	//request.setChartProperties(argumentCollection=stArgs);
	//request.setFlexProperties(argumentCollection=stArgs);
	//request.setDebugProperties(argumentCollection=stArgs);
	
</cfscript>
