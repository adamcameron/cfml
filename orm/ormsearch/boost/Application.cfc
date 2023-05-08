component {

	this.name			= "ormSearchTest";
	this.datasource		= "scratch_mysql";
	this.ormEnabled		= true;
	this.ormSettings	= {
		cfclocation		= expandPath("./api/"),
		dialect			= "MySQL",
		logsql			= true,
		searchenabled	= true,
		search			= {
			autoIndex	= true
		}
	};
	
	boolean function onApplicationStart(){
		writeLog(file=this.name, text="Application started");
		return true;
	}
	
	void function onSessionStart(){
		writeLog(file=this.name, text="Session started");
	}
	
	boolean function onRequestStart(){
		writeLog(file=this.name, text="Request started");
		return true;
	}
	
	void function onRequest(template){
		writeLog(file=this.name, text="Template started");
		include arguments.template;
		writeLog(file=this.name, text="Template ended");
	}
	
	void function onRequestEnd(){
		writeLog(file=this.name, text="Request ended");
	}
	
	void function onSessionEnd(){
		writeLog(file=this.name, text="Session ended");
	}
	
	void function onApplicationEnd(){
		writeLog(file=this.name, text="Application ended");
	}

}