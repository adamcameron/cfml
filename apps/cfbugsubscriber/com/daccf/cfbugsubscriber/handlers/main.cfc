component  {


	public string function index(event, rc, prc){
		prc.title = "Hello World";
		prc.message = getModel("Message").get();
	}
	
	
	public string function message(event, rc, prc){
		event.paramValue("message", "");
		prc.message = rc.message;
		event.setView("main/default");
	}	

}