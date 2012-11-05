component  {

	public string function index(event, rc, prc){
		prc.title = "Create Account";
		prc.message = getModel("Message").get();
	}

}