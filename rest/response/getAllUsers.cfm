<cfscript>
	user = new User();
	users = user.getAll();
	writeDump(var=variables);
</cfscript>