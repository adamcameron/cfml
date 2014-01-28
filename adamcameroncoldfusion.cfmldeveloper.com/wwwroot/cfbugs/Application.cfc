component {

	this.name 		= "cfbugnotifier20140115";
	this.mappings	= {
		"/cfbugnotifier" = expandPath("../../com/daccf/cfbugnotifier"),
		"/javaloader"	 = expandPath("../../com/compoundtheory/javaloader"),
		"/twitter4j"	 = expandPath("../../org/twitter4j")
	};

	public void function onApplicationStart(){
		loadServices();
	}
	
	public void function onRequest(required string requestedTemplate){
		include arguments.requestedTemplate;
	}
	
	private void function loadServices(){
		application.twitterService	= createObject("cfbugnotifier.TwitterService");	// not init-ed on purpose, as they required secret values I'll initialise remotely
		application.mailService		= createObject("cfbugnotifier.MailService");	// ditto
		
		application.adobeBugService	= new cfbugnotifier.AdobeBugService();	// this one is OK to init
	}

}