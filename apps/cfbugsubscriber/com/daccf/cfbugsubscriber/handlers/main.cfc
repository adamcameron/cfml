component  {

	public string function index(event, rc, prc){
		prc.title = "Hello World";
		prc.message = getModel("Message").get();
	}

}