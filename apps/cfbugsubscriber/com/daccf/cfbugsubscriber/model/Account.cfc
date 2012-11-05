component {

	// internal use	
	variables.passwordRegex = "^(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[0-9].*)(?=.*[^a-zA-Z0-9].*).{8,}$";
	variables.validationMessages = {
		badLogin		= "Login missing or invalid. Must be an email address",
		badPassword		= "Password missing or invalid. Password is a required field and must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.",
		badConfirm		= "Password confirmation missing or invalid. Password confirmation is a required field and must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.",
		passwordMismatch= "Password & password confirm must match"
	};

	// exposed externally (without making internal-use ones unreliable)
	this.passwordRegex		= variables.passwordRegex;
	this.validationMessages = structCopy(variables.validationMessages);

	public struct function validate(required struct accountData){
		var result = {
			isValid		= true,
			messages	= []
		};
		
		if (!(structKeyExists(accountData, "login") && isValid("email", accountData.login ))){
			result.isValid = false;
			arrayAppend(result.messages, variables.validationMessages.badLogin);
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
}