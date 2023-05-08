<cfscript>
include "./auth.cfm";

paths = [expandPath("/org/twitter4j/twitter4j-core-2.2.6.jar")];
javaLoader = createObject("com.compoundtheory.javaloader.JavaLoader").init(paths);

configBuilder = javaLoader.create("twitter4j.conf.ConfigurationBuilder");
configBuilder.setOAuthConsumerKey(auth.consumerKey);
configBuilder.setOAuthConsumerSecret(auth.consumerSecret);
configBuilder.setOAuthAccessToken(auth.accessToken);
configBuilder.setOAuthAccessTokenSecret(auth.accessTokenSecret);
config = configBuilder.build();

twitterFactory = javaLoader.create("twitter4j.TwitterFactory").init(config);
twitter = twitterFactory.getInstance();

twitter.updateStatus("Hello_World_8");
</cfscript>