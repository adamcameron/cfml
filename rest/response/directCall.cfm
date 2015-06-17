<cfscript>
	userService = new User();

	user1 = userService.getById(1);
	user2 = userService.getById(2);
	writeDump(var=[user1,user2]);
</cfscript>