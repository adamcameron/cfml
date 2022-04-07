// Application.cfc
component {

	this.name = "shutdownSequenceTest10";
	logIt("Begin Pseudoconstructor");
	this.applicationTimeout		= createTimespan(0,0,2,0);
	this.sessionManagement		= true;
	this.sessionTimeout			= createTimespan(0,0,2,0);
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

	function onSessionStart(){
		logIt("Begin onSessionStart() for #session.sessionId#");
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

	function onSessionEnd(struct sessionScope){
		logIt("Begin onSessionEnd() for #sessionScope.sessionId#");
		sleep(variables.sleepDuration);
		logIt("End onSessionEnd() for #sessionScope.sessionId#");
	}

	function onApplicationEnd(){
		logIt("Begin onApplicationEnd()");
		sleep(variables.sleepDuration * 5); // need some time to react
		logIt("End onApplicationEnd()");
	}
	
	function logIt(required String message){
		writeLog(file=this.name, text="#message# from @ #listLast(CGI.script_name, '/\')# via #rereplaceNoCase(CGI.user_agent, '.*?(chrome|firefox)?.*?', '\1', 'all')#");
	}

}