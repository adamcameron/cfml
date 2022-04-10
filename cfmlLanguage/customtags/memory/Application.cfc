component {

	this.name	= "testCUstomTagMemory01";

	function onApplicationStart(){
		application.featureToggle = new lib.api.FeatureToggle();
	}

	function onRequest(){
		request.logFile = listFirst(listLast(arguments[1], "\/"), ".");
		include arguments[1];
	}

}