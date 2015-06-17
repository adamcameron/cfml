<cftry>
	<cfinclude template="../connection/open.cfm">

<cfexchangetask		action		= "get"
					name		= "qTasks"
					connection	= "connExch"
>
<cfquery name="q" dbtype="query">
	select	*
	from	qTasks
</cfquery>
	<cfdump var="#q#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>