<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangecalendar	action		= "get"
					    name		= "qCalendar"
					    connection	= "connExch"
	>
		<cfexchangefilter name="startTime" from="#createDateTime(2009, 3, 1, 0, 0, 0)#" to="#createDateTime(2009, 3, 1, 23, 59, 59)#">
	</cfexchangecalendar>

	<cfdump var="#qCalendar#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>