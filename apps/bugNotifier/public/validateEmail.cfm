<cfscript>
	if (structKeyExists(URL, "email") && structKeyExists(URL, "validationToken")){
		variables.user = entityLoad("User",  {email=URL.email, validationToken=validationToken}, true);

		if (structKeyExists(variables, "user")){
			variables.user.setActive(true);
			entitySave(variables.user);
			writeOutput("Account activated");
		}else{
			writeOutput("No match found for email [#htmlEditFormat(URL.email)#] / token: [#htmlEditFormat(URL.validationToken)#]");
		}
	}else{
		throw("InvalidParameterException");
	}
</cfscript>