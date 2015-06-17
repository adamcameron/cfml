<cfscript>
	userService = new service.User();
	users = userService.getAll();

	writeDump(var=users);
</cfscript>