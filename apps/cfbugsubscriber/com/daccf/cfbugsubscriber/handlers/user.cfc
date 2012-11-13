component  {

	public string function login(event, rc, prc){
		prc.title = "Login";
		event.setView("user/login");
	}
	
	public string function authorise(event, rc, prc){
		var user	= false;
		var result	= false;

		event.noRender();

		if (structKeyExists(arguments.rc, "email") && structKeyExists(arguments.rc, "password")){
			user = getModel("User");
			result = user.authorise(email=arguments.rc.email, password=arguments.rc.password);
			if (result){
				nextEvent = "main.index";
			}else{
				nextEvent = "user.login";
			}
			setNextEvent(event=nextEvent);
		}else{
			throw(
				type	= "InvalidParameters",
				message	= "Missing or invalid parameters",
				detail	= "You must provide an email and password to log in"
			);
		}
	}

	public string function logout(event, rc, prc){
		event.noRender();
		getModel("User").logout();
		setNextEvent(event="user.login");
	}

}