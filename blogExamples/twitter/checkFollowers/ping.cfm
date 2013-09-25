<cfscript>
	accountSettings = application.twitterService.getAccountSettings();
	writeDump(var=accountSettings, label="Account Settings");
</cfscript>