<cfparam name="URL.uid">

<cftry>
	<cfinclude template="../connection/open.cfm">


	<cfset stEvent = {
		message = "Updated @" & timeFormat(now(), "HH:mm:ss.lll")
	}>

	<cfexchangecalendar
	    action		= "modify"
	    event		= "#stEvent#"
	    uid			= "#URL.uid#"
	    connection	= "connExch"
	>

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>