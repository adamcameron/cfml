component  {

	public string function create(event, rc, prc){
		prc.title = "Create Account";
		event.paramValue("messages", []);
		
		var account = getModel("Account");
		prc.passwordRegex = account.passwordRegex;
		prc.validationMessages = account.validationMessages;
		event.setView("account/newForm");
	}

	public string function save(event, rc, prc){
		var account 	= getModel("Account");
		var validation	= account.validate(rc);
		var newAccount	= false;

		event.noRender();

		if (validation.isValid){
			// Create the account
			//try {
				newAccount = account.create(rc);
			//} catch (any e){	// probably a duplicate
			//	event.setValue("messages", [account.validationMessages.createError]);
			//	setNextEvent(event="account.create", persist="messages");
			//}
			// all good.  Send an activation email
			//try {
				account.sendActivation(
					email			= newAccount.getEmail(),
					activationToken	= newAccount.getActivationToken(),
					activationUrl	= event.buildLink("account.activate")
				);
			//}
			//catch (any e){
			//	event.setValue("messages", [account.validationMessages.createError]);
			//}
			
			setNextEvent(event="account.confirm", persist="login");
		}else{ //bounce 'em back
			event.setValue("messages", validation.messages);
			setNextEvent(event="account.create", persist="messages");
		}
	}

	public string function confirm(event, rc, prc){
		event.paramValue("login", "the email address you specified");	// the default is if they  
		event.setView("account/checkEmail");
	}

}