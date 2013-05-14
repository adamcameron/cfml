component {


	public string function main(event, rc, prc){
		var bug					= getModel("Bug");
		prc.bugIdRegex			= bug.bugIdRegex;
		prc.validationMessages	= bug.validationMessages;
		event.setView("bugs/main");
	}

	
	public string function create(event, rc, prc){
		var bug 				= getModel("Bug");
		var validation			= bug.validate(rc);
		var bugToSubscribe		= false;
		var accountToSubscribe	= false;
		var	accountData			= structNew();

		event.noRender();

		if (validation.isValid){
			// load the bug
			accountData.adobeId		= rc.bug;
			bugToSubscribe = bug.get(accountData=accountData);	// if the bug was validated, then it'll've been added too

			accountData		= structNew();
			accountData.id	= getPlugin("SessionStorage").getVar("id");
			accountToSubscribe = getModel("Account").get(accountData=accountData);
			bug.associateAccount(bugId=bugToSubscribe.getId(), accountid=accountToSubscribe.getId());
			event.setValue("messages", ["Subscribed to bug"]);
		}else{ //bounce 'em back
			event.setValue("messages", validation.messages);
		}
		setNextEvent(event="bug.main", persist="messages");
	}
	
	
}