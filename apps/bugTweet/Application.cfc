component {

	this.name		= "bugTweet3";
	this.mappings	= {
		"/org"	= expandPath("/shared/git/org"),
		"/com/compoundtheory"	= expandPath("/shared/git/com/compoundtheory")
	};

	public void function onApplicationStart(){
		application.twitterService = createObject("TwitterService");	// not init-ed on purpose
	}


}