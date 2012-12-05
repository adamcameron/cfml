<cfcomponent output="false">


	<cfscript>
	import com.daccf.cfbugsubscriber.orm.*;
	import com.daccf.cfbugsubscriber.services.*;


	// internal use	
	variables.passwordRegex = "^(?=.*[A-Z].*)(?=.*[a-z].*)(?=.*[0-9].*)(?=.*[^a-zA-Z0-9].*).{8,}$";
	variables.validationMessages = {
		badEmail		= "Email missing or invalid. Must be a valid email address",
		badPassword		= "Password missing or invalid. Password is a required field and must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.",
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
	
	
	public com.daccf.cfbugsubscriber.orm.Account function get(required struct accountData){
		return entityLoad("Account", arguments.accountData, true);
	}
	
	
	public boolean function resetPassword(required struct accountData){
		var thisAccount = entityLoad("Account", {email=accountData.email, pwdChangeToken=accountData.pwdChangeToken}, true);
		if (structKeyExists(local, "thisAccount")){
			thisAccount.setPassword(accountData.password);
			thisAccount.setPwdChangeToken(javaCast("null",""));
			entitySave(thisAccount);
			return true;
		}else{	// no match, so no update
			return false;
		}
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


	/**
	@hint Updates the account. returns true if account existsed (and accordingly could be updated), otherwise false
	*/
	public boolean function update(required numeric id, string email, string password){
		var account = entityLoad("Account", arguments.id, true);
		if (structKeyExists(local, "account")){
			if (structKeyExists(arguments, "email")){
				account.setEmail(arguments.email);
			}
			if (structKeyExists(arguments, "password")){
				account.setPassword(arguments.password);
			}
			entitySave(account);
			return true;
		}
		return false;
	}


	/**
	@hint Verifies a user via ID and password.
	*/
	public boolean function authenticate(required numeric id, required string password){
		var account = entityLoad(
			"Account", 
			{
				id		= arguments.id,
				password= hash(arguments.password),
				active	= 1
			},
			true
		);
		return structKeyExists(local, "account");
	}
	</cfscript>


	<cffunction name="authorise" returntype="numeric" access="public" hint="Logs-in the user. Returns the ID of the authorised user, or zero if authorisation failed.">
		<cfargument name="email"	type="string"	required="true" hint="User's login ID">
		<cfargument name="password"	type="string"	required="true" hint="User's password">

		<cfset var user = false>
		<cfset var result = 0>
		<cfset var loginArgs = {
			email	= arguments.email,
			password= hash(arguments.password),
			active	= 1
		}>
		<cflogout>
		<cflogin>
			<cfset user = entityLoad("Account", loginArgs, true)>
			<cfif structKeyExists(local, "user")>
				<cfloginuser name="#arguments.email#" password="#arguments.password#" roles="user">
				<cfset result = user.getId()>
			</cfif>
		</cflogin>
		<cfreturn result>
	</cffunction>
	
	
	<cffunction name="logout" returntype="void" access="public" hint="Logs-out the user">
		<cflogout>
	</cffunction>
	
	
	
	
</cfcomponent>