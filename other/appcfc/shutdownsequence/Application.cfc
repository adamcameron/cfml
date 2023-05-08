// Application.cfc
component {

	this.name = "shutdownSequenceTest12";
	logIt("Begin Pseudoconstructor");
	this.applicationTimeout		= createTimespan(0,0,2,0);
	variables.sleepDuration		= 3000;
	sleep(variables.sleepDuration);
	logIt("End Pseudoconstructor");


	function onApplicationStart(){
		logIt("Begin onApplicationStart()");
		sleep(variables.sleepDuration);
		logIt("Mid onApplicationStart()");
		sleep(variables.sleepDuration);
		logIt("End onApplicationStart()");
	}

	function onRequestStart(){
		logIt("Begin onRequestStart()");
	}

	/**
	@output true
	*/
	function onRequest(){
		include arguments[1];
	}

	function onRequestEnd(){
		sleep(variables.sleepDuration);
		logIt("End onRequestEnd()");
	}

	function onApplicationEnd(){
		logIt("Begin onApplicationEnd()");
		sleep(variables.sleepDuration * 3); // need some time to react
		logIt("Mid onApplicationEnd()");
		sleep(variables.sleepDuration * 3); // need some time to react
		logIt("End onApplicationEnd()");
	}
	
	function logIt(required String message){
		writeLog(file=this.name, text="#message# from @ #listLast(CGI.script_name, '/\')#");
	}

}