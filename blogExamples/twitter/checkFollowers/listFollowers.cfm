<cfscript>
	followersIds = application.twitterService.getFollowersIds(screen_name="daccfml");
	writeDump(var=followersIds, label="Followers IDs");
</cfscript>