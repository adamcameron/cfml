<cfscript>
	param URL.consumerKey;
	param URL.consumerSecret;
	param URL.oauthToken;
	param URL.oauthTokenSecret;
	param URL.userAccountName;

	application.twitterService = new com.coldfumonkeh.monkehTweet(
		consumerKey		= URL.consumerKey,
		consumerSecret	= URL.consumerSecret,
		oauthToken		= URL.oauthToken,
		oauthTokenSecret= URL.oauthTokenSecret,
		userAccountName	= URL.userAccountName,
		parseResults	= true
	);

	accountSettings = application.twitterService.getAccountSettings();
	
	writeDump(accountSettings);
</cfscript>