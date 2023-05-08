component {

	this.name	= "remoteMethodAppInitTest04";
	logit("pseudoConstructor");

	public void function onApplicationStart(){
		application.token = createUuid();
		logit(getFunctionCalledName() & ":" & application.token);
	}

	public void function onSessionStart(){
		logit(getFunctionCalledName());
	}

	public void function onRequestStart(){
		logit(getFunctionCalledName());
	}

	public void function onRequest(){
		logit(getFunctionCalledName());
		include arguments[1];
	}

	public any function onCfcRequest(required string cfc, required string method, required struct args){
		logit(getFunctionCalledName());
		return invoke(cfc, method, args);
	}

	public void function onRequestEnd(){
		logit(getFunctionCalledName());
	}

	public void function onSessionEnd(){
		logit(getFunctionCalledName());
	}

	public void function onApplicationEnd(){
		logit(getFunctionCalledName());
	}

	private void function logit(required string text){
		writeLog(file=this.name, text=text);
	}

}