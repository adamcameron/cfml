//Application.cfc
component {

	this.name		= "general201404051235";
	this.mappings	= {
		"/cfmlnotifier" = expandPath("/com/daccf/cfmlnotifier"),
		"/javaloader"	 = expandPath("/com/compoundtheory/javaloader"),
		"/twitter4j"	 = expandPath("/org/twitter4j")
	};

	public void function onApplicationStart(){
	}

	public void function onRequest(required string requestedTemplate){
		include arguments.requestedTemplate;
	}

	private void function loadServices(){
		application.twitterService	= createObject("cfmlnotifier.TwitterService");	// not init-ed on purpose, as they required secret values I'll initialise remotely
		application.bitlyService	= createObject("cfmlnotifier.BitlyService");	// ditto
		application.mailService		= createObject("cfmlnotifier.MailService");	// ditto
	}

}