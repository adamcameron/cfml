<cfscript>
	user = entityLoad("User", 1, true);
	bugs = entityLoad("Bug");
	for (bug in bugs){
		user.addbugs(bug);
	}
	
	entitySave(user);
</cfscript>