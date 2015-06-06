<cfscript>
	
	twitter = application.twitterService.getTwitter();
	
	writeDump(twitter);
	writeDump(twitter.getHomeTimeline());
</cfscript>
