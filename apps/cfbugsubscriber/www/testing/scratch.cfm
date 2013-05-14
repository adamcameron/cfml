<cfscript>
throw "fucker0";
			bugToSubscribe = getModel("Bug").get(accountData={adobeId=rc.bug});	// if the bug was validated, then it'll've been added too
throw "fucker1";
			accountToSubscribe = getModel("Account").get(accountData={id=getPlugin("SessionStorage").getVar("id")});
throw "fucker2";			
			getModel("Bug").associateAccount(bugId=bugToSubscribe.getId(), accountid=accountToSubscribe);
throw "fucker3";

</cfscript>