component {

	this.name				= "sessionInvalidate10";
	this.sessionManagement	= true;
	this.sessionTimeout		= createTimeSpan(0,0,1,0);
	
	public function onSessionStart(){
		session.uuid = createUuid();
		writeLog(file=this.name, text="onSessionStart() fired for session #session.uuid#");
	}
	
	public function onSessionEnd(sessionScope, applicationScope){
		writeLog(file=this.name, text="onSessionEnd() fired for session #arguments.sessionScope.uuid#");
	}

}