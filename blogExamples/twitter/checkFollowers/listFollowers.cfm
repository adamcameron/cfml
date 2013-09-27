<cfscript>
	followers = application.twitterService.getFollowersIds(screen_name="daccfml");
	writeDump(var=followers, label="Followers IDs");


	for (follower in followers.ids){
		details = application.twitterService.GETUSERDETAILS(user_id=follower);
		writeDump(label="id=#details.id#", var={
			id=details.id,
			name=details.name,
			screen_name=details.screen_name
		});

		break;
	}

</cfscript>