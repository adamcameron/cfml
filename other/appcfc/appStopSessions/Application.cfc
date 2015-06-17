component {

	this.name = "appStopSessions1";
	this.sessionManagement = true;

	function onApplicationStart(){
		logIt("onApplicationStart()");
	}

	function onSessionStart(){
		logIt("onSessionStart() for #session.sessionId#");
		session.uuid = createUuid();
	}

	function onRequest(){
		include arguments[1];
	}

	function onSessionEnd(){
		logIt("onSessionEnd() for #arguments[1].sessionId#");
	}

	function onApplicationEnd(){
		logIt("onApplicationEnd()");
	}
	
	function logIt(required String message){
		writeLog(file=this.name, text="#message# from @ #listLast(CGI.script_name, '/\')# via #rereplaceNoCase(CGI.user_agent, '.*?(chrome|firefox)?.*?', '\1', 'all')#");
	}

}