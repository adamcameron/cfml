<cftry>
	<cfinclude template="../connection/open.cfm">

<cfexchangemail	action		= "get"
				name		= "qMail"
				connection	= "connExch"
				folder		= "/Inbox/z_other/Fiends/F"
>

<cfquery name="q" dbtype="query">
	select	*
	from	qMail
</cfquery>
	<cfdump var="#q#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>