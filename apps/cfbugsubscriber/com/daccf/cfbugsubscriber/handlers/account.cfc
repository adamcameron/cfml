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
			try {
				newAccount = account.create(rc);
			} catch (any e){	// probably a duplicate
				event.setValue("messages", [account.validationMessages.createError]);
				setNextEvent(event="account.create", persist="messages");
			}
			// all good.  Send an activation email
			try {
				account.sendActivation(
					email			= newAccount.getEmail(),
					activationToken	= newAccount.getActivationToken(),
					activationUrl	= event.buildLink(linkTo="account.activate", baseUrl=variables.getSetting("appHomeUrl"))
				);
			}
			catch (any e){
				event.setValue("messages", [account.validationMessages.createError]);
			}
			
			setNextEvent(event="account.confirm", persist="email");
		}else{ //bounce 'em back
			event.setValue("messages", validation.messages);
			setNextEvent(event="account.create", persist="messages");
		}
	}

	public string function confirm(event, rc, prc){
		event.paramValue("email", "the email address you specified");
		event.setView("account/checkEmail");
	}
	
	public string function activate(event, rc, prc){
		var activated	= false;
		var nextEvent	= "";
		
		event.noRender();
		
		if (structKeyExists(arguments.rc, "email") && structKeyExists(arguments.rc, "activationToken")){
			activated = getModel("Account").activate(email=arguments.rc.email, activationToken=arguments.rc.activationToken);
			if (activated){
				nextEvent = "account.activated";
			}else{
				nextEvent = "account.activationFailed";
			}
			setNextEvent(event=nextEvent);
		}else{
			throw(
				type	= "InvalidParameters",
				message	= "Missing or invalid parameters",
				detail	= "You must provide an email and activationToken in the URL"
			);
		}
	}
	
	public string function activationFailed(event, rc, prc){
		prc.title = "Account Activation";
		event.setView("account/activationFailed");
	}
	
	public string function activated(event, rc, prc){
		prc.title = "Account Activation";
		event.setView("account/activated");
	}

	public string function resetRequest(event, rc, prc){
		prc.title = "Request Pasword Reset";
		event.setView("account/resetRequestForm");
	}

	public string function sendResetRequest(event, rc, prc){
		event.noRender();

		if (structKeyExists(arguments.rc, "email")){
			getModel("Account").sendResetRequest(
				email	= arguments.rc.email,
				resetUrl= event.buildLink(linkTo="account.passwordResetForm", baseUrl=variables.getSetting("appHomeUrl"))
			);
		}else{
			throw(
				type	= "InvalidParameters",
				message	= "Missing or invalid parameters",
				detail	= "You must provide an email address"
			);
		}
	}

	public string function passwordResetForm(event, rc, prc){
		prc.title = "Pasword Reset";
		event.setView("account/passwordForm");
	}

	// TODO: this
	public string function resetPassword(event, rc, prc){
		var account 	= getModel("Account");
		var validation	= account.validate(rc);
		var newAccount	= false;

		event.noRender();

		if (validation.isValid){
			// reset the password

			newAccount = account.create(rc);
			
			setNextEvent(event="account.resetPassword", persist="email");
		}else{ //bounce 'em back
			event.setValue("messages", validation.messages);
			setNextEvent(event="account.resetPassword", persist="messages");
		}
	}

}