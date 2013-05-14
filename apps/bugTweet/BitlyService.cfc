component {

	public TwitterService function init(required string consumerKey, required string consumerSecret, required string accessToken, required string accessTokenSecret){
		var javaLoader = createObject("com.compoundtheory.javaloader.JavaLoader").init([expandPath("/org/twitter4j/twitter4j-core-2.2.6.jar")]);
		var configBuilder = javaLoader.create("twitter4j.conf.ConfigurationBuilder");

		configBuilder.setOAuthConsumerKey(arguments.consumerKey);
		configBuilder.setOAuthConsumerSecret(arguments.consumerSecret);
		configBuilder.setOAuthAccessToken(arguments.accessToken);
		configBuilder.setOAuthAccessTokenSecret(arguments.accessTokenSecret);

		variables.twitter = javaLoader.create("twitter4j.TwitterFactory").init(configBuilder.build()).getInstance();

		return this;
	}

	public void function updateStatus(required string message){
		if (!structkeyExists(variables, "twitter")){
			throw(
				type	= "ObjectNotInitializedException",
				message	= "The TwitterService has not been initialised",
				detail	= "The TwitterService object needs to be initialised with authorsation credentials before it can be used"
			);
		}
		variables.twitter.updateStatus(arguments.message);
	}

	// <cfhttp url="http://api.bit.ly/v3/shorten?login=#stArgs.login#&apiKey=#stArgs.apiKey#&uri=#stArgs.uri#&format=#stArgs.format#" method="get" />

}

