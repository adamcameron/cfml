// Application.cfc
component {

	this.name = "testRest07";

	function onApplicationStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onApplicationEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onSessionStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onSessionEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onRequestStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onRequestEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onRequest(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called for #arguments[1]#");
	}

	function onCfcRequest(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
	}

	function onError(){
		writeLog(file=this.name, text="#getFunctionCalledName()#() called");
		throw(object=arguments[1]);
	}

}