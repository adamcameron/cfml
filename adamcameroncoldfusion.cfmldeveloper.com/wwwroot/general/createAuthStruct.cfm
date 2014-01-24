<cfscript>
// createAuthStruct.cfm
application.authStruct = {
	consumerKey			= URL.consumerKey,
	consumerSecret		= URL.consumerSecret,
	accessToken			= URL.accessToken,
	accessTokenSecret	= URL.accessTokenSecret
};
</cfscript>