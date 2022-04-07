<cfparam name="URL.id" default="0" type="integer">
<cfoutput>Running Test ORM #now()#</cfoutput>
<cfscript>
	Account = new domain.Account();
	if (URL.id){
		Account.setId(URL.id);
	}
	Account.setUsername("andrews14");
	Account.setPassword("password");
	Account.setFirstName("Andrew");
	Account.setLastName("Scott");
	tickBegin = GetTickCount();
	//Account.Save();
	EntitySave(Account);
	tickEnd = GetTickCount();
</cfscript>
<cfset loopTime = tickEnd - tickBegin>
<cfoutput>runtime was: #loopTime# milliseconds</cfoutput>