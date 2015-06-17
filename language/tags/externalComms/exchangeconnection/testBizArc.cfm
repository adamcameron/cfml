<cfscript>
	stArgs = structNew();
	stArgs.action					= "open";
	stArgs.userName					= "adamcameron";
	stArgs.password					= "(0c3l0t)UK";
	stArgs.server					= "owa1.bizarc.com/acameron%40straker-interactive.com/";
	stArgs.connection				= "oExchCon";
//	stArgs.formBasedAuthentication	= false;
	stARgs.mailboxName				= "adamcameron";
</cfscript>

<cfexchangeConnection attributeCollection="#stARgs#">
<cfdump var="#oExchCon#">