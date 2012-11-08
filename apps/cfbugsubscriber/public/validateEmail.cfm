<cfscript>
	if (structKeyExists(URL, "email") && structKeyExists(URL, "activationToken")){
		variables.account = entityLoad("Account",  {email=URL.email, activationToken=activationToken}, true);

		if (structKeyExists(variables, "Account")){
			variables.account.setActive(true);
			entitySave(variables.account);
			writeOutput("Account activated");
		}else{
			writeOutput("No match found for email [#htmlEditFormat(URL.email)#] / token: [#htmlEditFormat(URL.activationToken)#]");
		}
	}else{
		throw("InvalidParameterException");
	}
</cfscript>