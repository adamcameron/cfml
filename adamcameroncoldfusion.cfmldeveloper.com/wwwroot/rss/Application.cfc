component {

	this.name 		= "rss02";
	this.mappings	= {
		"/cfmlnotifier" = expandPath("../com/daccf/cfmlnotifier"),
		"/javaloader"	 = expandPath("../com/compoundtheory/javaloader"),
		"/twitter4j"	 = expandPath("../org/twitter4j")
	};

	public void function onApplicationStart(){
		loadServices();
	}
	
	public void function onRequest(required string requestedTemplate){
		include arguments.requestedTemplate;
	}
	
	// TODO: dedupe a lot of this repetition!
	private void function loadServices(){
		// this lot not init-ed on purpose, as they required secret values I'll initialise remotely
		application.twitterService	= createObject("cfmlnotifier.TwitterService");
		application.bitlyService	= createObject("cfmlnotifier.BitlyService");
		application.mailService		= createObject("cfmlnotifier.MailService");
	}


}