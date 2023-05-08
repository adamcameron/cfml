<cftry>
	<cfinclude template="../connection/open.cfm">

<cfexchangecontact	action		= "get"
					name		= "qContacts"
					connection	= "connExch"
>
<cfquery name="q" dbtype="query">
	select	*
	from	qContacts
</cfquery>
	<cfdump var="#q#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>