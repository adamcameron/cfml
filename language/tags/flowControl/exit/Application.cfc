// Application.cfc
component {

	public void function onRequestEnd(){
		writeOutput("onRequestEnd() called<br>");
	}

	public void function onAbort(){
		writeOutput("onAbort() called<br>");
	}

}