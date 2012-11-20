component {

	import com.daccf.cfbugsubscriber.orm.*;
	import com.daccf.cfbugsubscriber.services.*;

	// internal use	
	variables.passwordRegex = "^(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[0-9].*)(?=.*[^a-zA-Z0-9].*).{8,}$";
	variables.validationMessages = {
		badEmail		= "Email missing or invalid. Must be a valid email address",
		badPassword		= "Password missing or invalid. Password is a required field and must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.",
		badConfirm		= "Password confirmation missing or invalid. Password confirmation is a required field and must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.",
		passwordMismatch= "Password & password confirm must match",
		createError		= "Error creating account. An account with that email address more than likely already exists"
	};

	// exposed externally (without making internal-use ones unreliable)
	this.passwordRegex		= variables.passwordRegex;
	this.validationMessages = structCopy(variables.validationMessages);


	public struct function validate(required struct accountData){
		var result = {
			isValid		= true,
			messages	= []
		};
		
		if (!(structKeyExists(accountData, "email") && isValid("email", accountData.email ))){
			result.isValid = false;
			arrayAppend(result.messages, variables.validationMessages.badEmail);
		}
		
		if (!(structKeyExists(accountData, "password") && reFind(variables.passwordRegex, accountData.password))){
			result.isValid = false;
			arrayAppend(result.messages, variables.validationMessages.badPassword);
		}
		
		if (!(structKeyExists(accountData, "confirm") && reFind(variables.passwordRegex, accountData.confirm))){
			result.isValid = false;
			arrayAppend(result.messages, variables.validationMessages.badConfirm);
		}
		
		if (!(structKeyExists(accountData, "password") && structKeyExists(accountData, "confirm") && accountData.password == accountData.confirm)){
			result.isValid = false;
			arrayAppend(result.messages, variables.validationMessages.passwordMismatch);
		}
		return result;
	}

	
	public com.daccf.cfbugsubscriber.orm.Account function create(required struct accountData){
		var newAccount = new com.daccf.cfbugsubscriber.orm.Account();
		newAccount.setEmail(accountData.email);
		newAccount.setPassword(accountData.password);

		entitySave(newAccount);	// this will error - by design - if it's a duplicate Account
		return newAccount;
	}

	
	public com.daccf.cfbugsubscriber.orm.Account function update(required struct accountData){
		var thisAccount = entityLoad("Account", {email=accountData.email, pwdChangeToken=accountData.pwdChangeToken}, true);
		thisAccount.setPassword(accountData.password);
		thisAccount.setPwdChangeToken(javaCast("null",""));

		entitySave(thisAccount);
		return thisAccount;
	}

	
	public void function sendActivation(required string email, require string activationToken, required string activationUrl){
		var mailer = new Mailer();
		mailer.sendActivation(email=email, activationToken=activationToken, activationUrl=activationUrl);
	}
	
	public boolean function activate(required string email, require string activationToken){
		var account = entityLoad("Account", {email=email,activationToken=activationToken}, true);
		if (structKeyExists(local, "account")){	// will return NULL if not
			account.setActive(true);
			return true;
		}
		return false;
	}

	
	public void function sendResetRequest(required string email, required string resetUrl){
		var account = entityLoad("Account", {email=email}, true);
		var mailer	= false;
		if (structKeyExists(local, "account")){	// can only set a reset to a valid account
			account.setPwdChangeToken(createUuid());
			entitySave(account);
			mailer = new Mailer();
			mailer.sendResetRequest(email=email, pwdChangeToken=account.getPwdChangeToken(), resetUrl=resetUrl);
		}
	}


}