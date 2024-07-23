// Application.cfc

component {

	this.name				= "testOnSessionEndExceptionLogging01";
	this.sessionManagement	= true;
	this.sessionTimeout		= createTimespan(0,0,0,30);

	function onSessionStart(){
		writeOutput("Session started @ #now()#<br>");
	}

	function onRequestStart(){
		writeOutput("Request started @ #now()#<br>");
	}

	function onSessionEnd(){
		writeLog(file=this.name, text="onSessionEnd() called");
		throw(type="OnSessionEndException", message="An exception was thrown", detail="On purpose");
	}
}