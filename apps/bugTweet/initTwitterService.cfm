<cfscript>
	if (structKeyExists(URL, "consumerKey") && structKeyExists(URL, "consumerSecret") && structKeyExists(URL, "accessToken") && structKeyExists(URL, "accessTokenSecret")){
		application.twitterService.init(
			consumerKey			= URL.consumerKey,
			consumerSecret		= URL.consumerSecret,
			accessToken			= URL.accessToken,
			accessTokenSecret	= URL.accessTokenSecret
		);

		writeOutput("Initialised");
	}
	// else nothing
</cfscript>