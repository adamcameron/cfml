<cfscript>
twitterService	= createObject("cfbugnotifier.TwitterService").init(argumentCollection=application.authStruct);
twitter = twitterService.getTwitter();
writeDump(var=twitter, label="twitter");

config = twitter.getConfiguration();
writeDump(var=config, label="config");
writeDump(var=config.getRestBaseURL(), label="getRestBaseURL()");
</cfscript>