// Application.cfc
component {

	variables.requestStartTime = getTickCount();

	this.name				= "timeoutTest30";
	this.sessionManagement	= true;
	this.applicationTimeout	= createTimespan(0,0,2,0);
	this.sessionTimeout		= createTimespan(0,0,1,0);

	function onApplicationStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()# @ #getTickCount()-variables.requestStartTime#");
	}

	function onSessionStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()# @ #getTickCount()-variables.requestStartTime#");
	}

	function onRequestStart(){
		writeLog(file=this.name, text="#getFunctionCalledName()# @ #getTickCount()-variables.requestStartTime#");
	}

	function onRequest(){
		include arguments[1];
	}
	
	function onRequestEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()# @ #getTickCount()-variables.requestStartTime#");
	}
	
	function onSessionEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()# @ #getTickCount()-variables.requestStartTime#");
	}
	
	function onApplicationEnd(){
		writeLog(file=this.name, text="#getFunctionCalledName()# @ #getTickCount()-variables.requestStartTime#");
	}

}