component  {


	public string function createForm(event, rc, prc){
		prc.title = "Create Account";
		event.paramValue("messages", []);
		
		var account = getModel("Account");
		prc.passwordRegex = account.passwordRegex;
		prc.validationMessages = account.validationMessages;
		event.setView("account/newForm");
	}


	public string function updateForm(event, rc, prc){
		prc.title = "Update Account";
		event.paramValue("messages", []);
		
		var account = getModel("Account");
		prc.passwordRegex = account.passwordRegex;
		prc.validationMessages = account.validationMessages;
		event.setView("account/updateForm");
	}


	public string function create(event, rc, prc){
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
				setNextEvent(event="account.createForm", persist="messages");
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
			setNextEvent(event="account.createForm", persist="messages");
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
				type	= "InvalidParametersException",
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


	public string function requestPasswordReset(event, rc, prc){
		prc.title = "Request Pasword Reset";
		var account = getModel("Account");
		prc.validationMessages = account.validationMessages;
		event.setView("account/resetRequestForm");
	}


	public string function sendResetRequest(event, rc, prc){
		if (structKeyExists(arguments.rc, "email")){
			getModel("Account").sendResetRequest(
				email	= arguments.rc.email,
				resetUrl= event.buildLink(linkTo="account.passwordResetForm", baseUrl=variables.getSetting("appHomeUrl"))
			);
			event.setValue("message", "Password reset email sent");
			setNextEvent(event="main.message", persist="message");
		}else{
			throw(
				type	= "InvalidParametersException",
				message	= "Missing or invalid parameters",
				detail	= "You must provide an email address"
			);
		}
	}


	public string function passwordResetForm(event, rc, prc){
		prc.title = "Pasword Reset";
		event.paramValue("messages", []);
		var account = getModel("Account");
		prc.passwordRegex = account.passwordRegex;
		prc.validationMessages = account.validationMessages;
		event.setView("account/passwordResetForm");
	}


	public string function performPasswordReset(event, rc, prc){
		var account 	= getModel("Account");
		var validation	= account.validate(rc);
		
		event.noRender();

		if (validation.isValid){
			// reset the password
			var result	= account.resetPassword(rc);
			if (result){
				setNextEvent(event="account.passwordResetComplete", persist="messages");
			}else{	
				event.setValue("messages", ["Password reset failed for #rc.email#"]);
				setNextEvent(event="account.requestPasswordReset", persist="messages");
			}
		}else{ //bounce 'em back
			event.setValue("messages", validation.messages);
			event.setValue("pwdChangeToken", rc.pwdChangeToken);
			event.setValue("email", rc.email);
			setNextEvent(event="account.passwordResetForm", persist="messages,pwdChangeToken,email");
		}
	}


	public string function passwordResetComplete(event, rc, prc){
		prc.title	= "Password Reset Complete";
		prc.message = prc.title;
	}
	
	
	public void function update(event, rc, prc){
		event.noRender();

		if (structKeyExists(arguments.rc, "id") && structKeyExists(arguments.rc, "currentPassword")){
			var account = getModel("Account"); 
			
			if (account.authenticate(id=arguments.rc.id, password=arguments.rc.currentPassword)){
				// sort out pwd
				if (!len(arguments.rc.password)){
					// this just expedites the validation process
					arguments.rc.password	= arguments.rc.currentPassword;
					arguments.rc.confirm	= arguments.rc.currentPassword;
				}
				
				var validation	= account.validate(rc);
				var properties	= {};

				if (validation.isValid){
					// update their stuff
					var result	= account.update(argumentCollection=arguments.rc);
					if (result){
						event.setValue("messages", ["Update successful"]);
					}else{	
						event.setValue("messages", ["Update failed"]);
					}
				}else{ //bounce 'em back
					event.setValue("messages", validation.messages);
				}
				
			}else{
				event.setValue("messages", ["Could not authenticate"]);
			}
			setNextEvent(event="account.updateForm", persist="messages");
		}else{
			throw(
				type	= "InvalidParametersException",
				message	= "Missing or invalid parameters",
				detail	= "You must provide an ID and password"
			);
		}
	}


	public string function login(event, rc, prc){
		prc.title = "Login";
		event.paramValue("message", "");
		event.setView("account/login");
	}

	
	public string function authorise(event, rc, prc){

		event.noRender();

		if (structKeyExists(arguments.rc, "email") && structKeyExists(arguments.rc, "password")){
			var account = getModel("Account");
			var result = account.authorise(email=arguments.rc.email, password=arguments.rc.password);
			var userSession = getPlugin("SessionStorage");
			
			if (result){	// this is the ID of the authorised user, or zero, so can be used as a boolean
				userSession.setVar("isLoggedIn", true);
				userSession.setVar("email", rc.email);
				userSession.setVar("id", result);
				setNextEvent(event="main.index");
			}else{
				userSession.clearAll();
				userSession.setVar("isLoggedIn", false);
				event.setValue("messages", ["Login failed for #arguments.rc.email#"]);
				setNextEvent(event="account.login", persist="messages");
			}
			
		}else{
			throw(
				type	= "InvalidParametersException",
				message	= "Missing or invalid parameters",
				detail	= "You must provide an email and password to log in"
			);
		}
	}


	public string function logout(event, rc, prc){
		event.noRender();
		getModel("Account").logout();
		getPlugin("SessionStorage").setVar("isLoggedIn", false);
		setNextEvent(event="account.login");
	}


}