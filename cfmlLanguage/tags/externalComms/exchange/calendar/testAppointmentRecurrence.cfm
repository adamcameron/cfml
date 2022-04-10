<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangecalendar	action		= "get"
					    name		= "qMeeting"
					    connection	= "connExch"
	>
		<cfexchangefilter name="subject" value="TEST APPOINTMENT 5 SUBJECT">
		<cfexchangefilter name="startTime" from="#createDateTime(2009, 3, 3, 0, 0, 0)#" to="#createDateTime(2009, 3, 3, 23, 59, 59)#">
	</cfexchangecalendar>
	<cfdump var="#qMeeting#" label="qMeeting">

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>