component {
	this.name = createUuid();
	
	/**
	@output true
	*/
	public void function onRequestStart(){
		writeOutput("onRequestStart() executed<br />");
	}
	
	/**
	@output true
	*/
	public void function onRequestEnd(){
		writeOutput("onRequestEnd() executed<br />");
	}
}