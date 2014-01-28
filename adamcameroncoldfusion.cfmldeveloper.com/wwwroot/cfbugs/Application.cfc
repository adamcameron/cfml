component {

	this.name 		= "cfmlnotifier20140115";
	this.mappings	= {
		"/cfmlnotifier" = expandPath("../../com/daccf/cfmlnotifier"),
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
		application.twitterService	= createObject("cfmlnotifier.TwitterService");	// not init-ed on purpose, as they required secret values I'll initialise remotely
		application.mailService		= createObject("cfmlnotifier.MailService");	// ditto
		
		application.adobeBugService	= new cfmlnotifier.AdobeBugService();	// this one is OK to init
	}

}