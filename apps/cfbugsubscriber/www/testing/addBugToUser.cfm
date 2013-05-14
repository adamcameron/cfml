<cfscript>
	account = entityLoad("Account", 1, true);
	bugs = entityLoad("Bug");
	for (bug in bugs){
		account.addbugs(bug);
	}
	
	entitySave(account);
</cfscript>