<cfparam name="URL.label">
<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangecalendar	action		= "get"
					    name		= "qMeeting"
					    connection	= "connExch"
	>
		<!--- <cfexchangefilter name="subject" value="#URL.label# SUBJECT"> --->
		<cfexchangefilter name="startTime" from="#createDateTime(2009, 3, 11, 0, 0, 0)#" to="#createDateTime(2009, 3, 11, 23, 59, 59)#">
	</cfexchangecalendar>
	<cfquery name="qMeeting" dbtype="query">
		select		*
		from		qMeeting
		order by	starttime
	</cfquery>
	<cfdump var="#qMeeting#" label="qMeeting">

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>