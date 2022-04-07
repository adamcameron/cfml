<cfscript>
	param name="URL.id" type="integer" default=0;
	userService = new service.User();
	user = userService.get(URL.id);

	writeDump(var=user);
</cfscript>