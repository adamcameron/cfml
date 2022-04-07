<cfscript>
include "./auth.cfm";
twitter = createObject("java", "twitter4j.Twitter");
twitter.setOAuthConsumer(auth.consumerKey, auth.consumerSecret);
twitter.setOAuthAccessToken(auth.accessToken, auth.accessTokenSecret);
twit_result = twitter.statuses_update("Hello World 3");
</cfscript>