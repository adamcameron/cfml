//Application.cfc
component {

	this.name		= "general09";
	this.mappings	= {
		"/cfbugnotifier" = expandPath("../../com/daccf/cfbugnotifier"),
		"/javaloader"	 = expandPath("../../com/compoundtheory/javaloader"),
		"/twitter4j"	 = expandPath("../../org/twitter4j")
	};

	public void function onApplicationStart(){
	}

	public void function onRequest(required string requestedTemplate){
		include arguments.requestedTemplate;
	}

	private void function loadServices(){
		application.twitterService	= createObject("cfbugnotifier.TwitterService");	// not init-ed on purpose, as they required secret values I'll initialise remotely
		application.bitlyService	= createObject("cfbugnotifier.BitlyService");	// ditto
		application.mailService		= createObject("cfbugnotifier.MailService");	// ditto
	}

}