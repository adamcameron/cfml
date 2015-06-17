<cfoutput>Running Test ORM #now()#</cfoutput>
<cfscript>
	Account = new domain.Account();
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