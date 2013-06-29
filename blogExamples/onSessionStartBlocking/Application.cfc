component {

	this.name				= "onSessionStartBlocking13";
	this.sessionManagement	= true;

	variables.requestId = createUuid();

	msg("in pseudoconstructor");


	public void function onApplicationStart(){
		application.start = getTickCount();
	}

	public void function onSessionStart(){
		msg("onSessionStart() top");
		lock scope="session" type="exclusive" timeout=6 throwontimeout=true {
			msg("onSessionStart() top of lock");
			for (var i=1; i<=5; i++){
				msg("onSessionStart() running");
				sleep(1000);
			}
			msg("onSessionStart() bottom of lock");
		}
		msg("onSessionStart() bottom");
	}

	public void function onRequestStart(){
		msg("onRequestStart() top");
		lock scope="session" type="readonly" timeout=6 throwontimeout=true {
			// NOWT. Just blocking
			msg("onRequestStart() in lock");
		}
		msg("onRequestStart() bottom");
	}

	public void function onRequest(){
		include arguments[1];
	}


	private string function ms(){
		if (isDefined("application.start")){
			var ms = application.start;
		}else{
			var ms = 0;

		}
		return "#getTickCount()-ms#ms";
	}

	private string function msg(required string message){
		var msg = "#variables.requestId#: #message# #ms()#";
		writeOutput("#msg#<br>");
		writeLog(file=this.name, text=msg);
	}

}