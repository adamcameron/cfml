component {

	this.name 		= "twitter4J_1";
	this.mappings	= {
		"/cfmlnotifier" = expandPath("./cfmlnotifier"),
		"/javaloader"	 = expandPath("./cfmlnotifier/com/compoundtheory/javaloader"),
		"/twitter4j"	 = expandPath("./cfmlnotifier./org/twitter4j")
	};
	
	public void function onApplicationStart(){
		include "/cfmlnotifier/www/auth.cfm";
		
		application.twitterService	= createObject("cfmlnotifier.com.daccf.cfmlnotifier.TwitterService").init(
			consumerKey			= auth.twitter.consumerKey,
			consumerSecret		= auth.twitter.consumerSecret,
			accessToken			= auth.twitter.accessToken,
			accessTokenSecret	= auth.twitter.accessTokenSecret
		);
	}


}