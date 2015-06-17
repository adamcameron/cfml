component {
	this.name = "testSessionRotation01";
	this.sessionManagement = true;

	function onSessionStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()# called: #session.sessionid# #serializeJson(cookie)#");
	}

	function onRequestStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()# called: #session.sessionid# #serializeJson(cookie)#");
	}

	function onRequestEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()# called: #session.sessionid# #serializeJson(cookie)#");
	}

	function onRequest(){
		include arguments[1];
	}
}