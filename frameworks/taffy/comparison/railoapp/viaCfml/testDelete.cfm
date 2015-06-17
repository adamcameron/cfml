<cfscript>
	param name="URL.id" type="integer" default=0;
	userService = new service.User();
	userService.delete(URL.id);
</cfscript>