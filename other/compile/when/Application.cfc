// Application.cfc
component {
	param URL.delay=0;

	this.name = "compilation01";
	writeLog(file=this.name, text="top of Application.cfc pseudo constructor");
	sleep(URL.delay);

	function onApplicationStart(){
		application.logName	= this.name;
		writeLog(file=this.name, text="top of Application.cfc onApplicationStart()");
		sleep(URL.delay);
	}

	function onSessionStart(){
		writeLog(file=this.name, text="top of Application.cfc onSessionStart()");
		sleep(URL.delay);
	}

	function onRequestStart(){
		writeLog(file=this.name, text="top of Application.cfc onRequestStart()");
		sleep(URL.delay);
	}

	function onRequest(){
		writeLog(file=this.name, text="top of Application.cfc onRequest()");
		sleep(URL.delay);
		include arguments[1];
		writeLog(file=this.name, text="bottom of Application.cfc onRequest()");
	}

	function onRequestEnd(){
		writeLog(file=this.name, text="top of Application.cfc onRequestEnd()");
		sleep(URL.delay);
	}

	function notCalled(){
		writeLog(file=this.name, text="top of Application.cfc notCalled()");
		sleep(URL.delay);
	}

}