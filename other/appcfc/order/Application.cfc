component {
	param name="server.hitId" default=0;
	server.hitId++;
	
	testScopes("in pseudoconstructor before application name is set", "pseudoconstructor");
	this.name = "scopeAvailability";
	this.sessionManagement = true;
	testScopes("in pseudoconstructor after application name is set", "pseudoconstructor");

	function onApplicationStart(){
		testScopes("in onApplicationStart", "pseudoconstructor");
		testScopes("in onApplicationStart", "onApplicationStart");
	}


	function onSessionStart(){
		testScopes("in onSessionStart", "pseudoconstructor");
		testScopes("in onSessionStart", "onApplicationStart");
		testScopes("in onSessionStart", "onSessionStart");
	}


	function onRequestStart(){
		testScopes("in onRequestStart", "pseudoconstructor");
		testScopes("in onRequestStart", "onApplicationStart");
		testScopes("in onRequestStart", "onSessionStart");
		testScopes("in onRequestStart", "onRequestStart");
	}


	function onRequest(){
		testScopes("in onRequest", "pseudoconstructor");
		testScopes("in onRequest", "onApplicationStart");
		testScopes("in onRequest", "onSessionStart");
		testScopes("in onRequest", "onRequestStart");
		testScopes("in onRequest", "onRequest");
		include arguments[1];

	}


	function onRequestEnd(){
		testScopes("in onRequestEnd", "pseudoconstructor");
		testScopes("in onRequestEnd", "onApplicationStart");
		testScopes("in onRequestEnd", "onSessionStart");
		testScopes("in onRequestEnd", "onRequestStart");
		testScopes("in onRequestEnd", "onRequest");
		testScopes("in onRequestEnd", "onRequestEnd");
	}


	function testScopes(message, varName){
		var logName = "scopeAvailability";
		writeLog(file=logName, text="==================================================");
		if (isDefined("application")){
			if (structKeyExists(application, varName)){
				writeLog(file=logName, text="#server.hitId# #message# application.#varName# existed");
			}else{
				writeLog(file=logName, text="#server.hitId# #message# application.#varName# initialised");
				application[varName] = true;
			}
		}else{
			writeLog(file=logName, text="#server.hitId# #message# application scope not enabled");
		}

		if (isDefined("session")){
			if (structKeyExists(session, varName)){
				writeLog(file=logName, text="#server.hitId# #message# session.#varName# existed");
			}else{
				writeLog(file=logName, text="#server.hitId# #message# session.#varName# initialised");
				session[varName] = true;
			}
		}else{
			writeLog(file=logName, text="#server.hitId# #message# session scope not enabled");
		}

		if (isDefined("request")){
			if (structKeyExists(request, varName)){
				writeLog(file=logName, text="#server.hitId# #message# request.#varName# existed");
			}else{
				writeLog(file=logName, text="#server.hitId# #message# request.#varName# initialised");
				request[varName] = true;
			}
		}else{
			writeLog(file=logName, text="#server.hitId# #message# request scope not enabled");
		}

		if (isDefined("this")){
			if (structKeyExists(this, varName)){
				writeLog(file=logName, text="#server.hitId# #message# this.#varName# existed");
			}else{
				writeLog(file=logName, text="#server.hitId# #message# this.#varName# initialised");
				this[varName] = true;
			}
		}else{
			writeLog(file=logName, text="#server.hitId# #message# this scope not enabled");
		}
	}

}