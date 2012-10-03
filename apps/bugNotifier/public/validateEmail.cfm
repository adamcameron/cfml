<cfscript>
	if (structKeyExists(URL, "email") && structKeyExists(URL, "activationToken")){
		variables.user = entityLoad("User",  {email=URL.email, activationToken=activationToken}, true);

		if (structKeyExists(variables, "user")){
			variables.user.setActive(true);
			entitySave(variables.user);
			writeOutput("Account activated");
		}else{
			writeOutput("No match found for email [#htmlEditFormat(URL.email)#] / token: [#htmlEditFormat(URL.activationToken)#]");
		}
	}else{
		throw("InvalidParameterException");
	}
</cfscript>