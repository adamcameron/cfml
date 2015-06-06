// Application.cfc
component {

	this.name = "namedLock1";
	this.applicationTimeout		= createTimespan(0,0,2,0);
	variables.sleepDuration		= 3000;
	sleep(variables.sleepDuration);


	function onApplicationStart(){
		logIt("Begin onApplicationStart()");
		logIt("Before lock onApplicationStart()");
		lock name="applicationEventHandlers" type="exclusive" timeout=variables.sleepDuration/100 {
			logIt("Top of lock onApplicationStart()");
			sleep(variables.sleepDuration);
			logIt("Mid onApplicationStart()");
			sleep(variables.sleepDuration);
			logIt("Bottom of lock onApplicationStart()");
		}
		logIt("After lock onApplicationStart()");
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
		logIt("Before lock onApplicationEnd()");
		try {
			lock name="applicationEventHandlers" type="exclusive" timeout=variables.sleepDuration/100 {
				logIt("Top of lock onApplicationEnd()");
				sleep(variables.sleepDuration * 3); // need some time to react
				logIt("Mid onApplicationEnd()");
				sleep(variables.sleepDuration * 3); // need some time to react
				logIt("Bottom of lock onApplicationEnd()");
			}
		}
		catch (any e){
			logIt("Exception in onApplicationEnd(): #e.message# #e.detail#");
		}
		logIt("End onApplicationEnd()");
	}
	
	function logIt(required String message){
		writeLog(file=this.name, text="#message# from @ #listLast(CGI.script_name, '/\')#");
	}

}