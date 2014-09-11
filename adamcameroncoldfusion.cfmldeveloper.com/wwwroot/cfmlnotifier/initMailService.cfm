<cfscript>
// relevant
	if (structKeyExists(URL, "username") && structKeyExists(URL, "password")){
		application.mailService.init(
			username= URL.username,
			password= URL.password
		);

		writeOutput("mailService initialised<br />");
	}
	// else nothing
</cfscript>