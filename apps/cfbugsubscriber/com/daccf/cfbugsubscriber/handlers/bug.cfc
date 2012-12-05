component {


	public string function main(event, rc, prc){
		var bug					= getModel("Bug");
		prc.bugIdRegex			= bug.bugIdRegex;
		prc.validationMessages	= bug.validationMessages;
		event.setView("bugs/main");
	}

	
	public string function create(event, rc, prc){
		var bug 		= getModel("Bug");
		var validation	= bug.validate(rc);


		event.noRender();
writeDump(var=validation, label="above");
		if (validation.isValid){
			// load the bug
writeDump(var=bug, label="within");

			var bugToSubscribe = bug.get(accountData={adobeId=rc.bug});
			
			
			
			//var accountToSubscribe = getModel("Account").get(accountData={id=getPlugin("SessionStorage").getVar("id")});
			
	writeOutput("here");		
abort;
			
			
			
			bugToSubscribe.addAccounts(accountToSubscribe);
			entitySave(bugToSubscribe);
		}else{ //bounce 'em back
			event.setValue("messages", validation.messages);
			setNextEvent(event="bug.main", persist="messages");
		}


	}
	
	
}