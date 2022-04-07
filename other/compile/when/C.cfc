// C.cfc
component {
	writeLog(file=application.logname, text="top of C.cfc pseudo constructor");
	sleep(URL.delay);

	function init(){
		writeLog(file=application.logname, text="top of C.cfc init()");
		sleep(URL.delay);
		return this;
	}

	function f(){
		writeLog(file=application.logname, text="top of C.cfc f()");
		sleep(URL.delay);
	}
}