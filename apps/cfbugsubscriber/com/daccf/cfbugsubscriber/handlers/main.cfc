component  {


	public string function index(event, rc, prc){
		setNextEvent(event="bug.main");
	}
	
	
	public string function message(event, rc, prc){
		event.paramValue("message", "");
		prc.message = rc.message;
		event.setView("main/default");
	}	


}