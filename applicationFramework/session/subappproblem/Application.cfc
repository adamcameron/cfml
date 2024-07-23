component {

	this.name = "topLevelApp01";
	this.sessionManagement = true;
	this.setclientcookies=false;

	function onApplicationStart(){
		writeOutput("#getFunctionCalledName()#() called from #getCurrentTemplatePath()#<br>");
	}

	function onSessionStart(){
		writeOutput("#getFunctionCalledName()#() called from #getCurrentTemplatePath()#<br>");
		session[this.name] = createUuid();
	}

	function onRequestStart(){
		writeOutput("#getFunctionCalledName()#() called from #getCurrentTemplatePath()#<br>");
	}

}