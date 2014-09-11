<cfscript>
// relevant
	if (structKeyExists(URL, "login") && structKeyExists(URL, "apiKey")){
		application.bitlyService.init(
			login	= URL.login,
			apiKey	= URL.apiKey
		);

		writeOutput("bitlyService initialised<br />");
	}
	// else nothing
</cfscript>