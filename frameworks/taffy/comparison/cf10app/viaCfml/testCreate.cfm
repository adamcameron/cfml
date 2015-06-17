<cfscript>
	if (CGI.request_method EQ "POST"){
		userService = new service.User();
		newUser = userService.create(argumentCollection=form);
		writeDump(var=newUser);		
	}
</cfscript>
<form method="post">
	<table>
	<cfloop index="property" array="#['firstName','lastName','age']#">
		<cfparam name="form.#property#" default="">
		<cfoutput><tr><td>#property#</td><td><input name="#property#" value="#form[property]#"></td></tr></cfoutput>
	</cfloop>
	</table>
	<input type="submit" value="Submit">
</form>