<cfscript>
	httpService = new http(
		method	= "get",
		url		= "http://adamcameroncoldfusion.cfmldeveloper.com/misc/greet.cfm",
		result	= "whatIsThisFor"
	);
	writeDump(httpService);

	result = httpService.send();
	writeDump(result);

	prefix = result.getPrefix();
	writeDump(prefix);

	result = httpService.getResult();
	writeDump(result);
</cfscript>