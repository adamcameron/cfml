<cfparam name="URL.label">
<cfparam name="URL.create" default="false" type="boolean">
<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfif URL.create>
		<cfset stArgs = {
			subject				= "#URL.label# SUBJECT",
			location			= "#URL.label# LOCATION",
			message				= "#URL.label# MESSAGE",
			startTime			= createDateTime(2009, 3, day(now()), 22, 0, 0),
			endTime				= createDateTime(2009, 3, day(now()), 23, 0, 0),
			duration			= 60,
			importance			= "high",
			isrecurring			= true,
			recurrenceType		= "WEEKLY",
			<!---recurrenceEndDate	= createDate(2009, 3, 17),--->
			<!--- recurrenceEndDate	= "3/17/2009", --->
			recurrenceCount		= 3,
			RecurrenceFrequency	= 1,
			RecurrenceDays		= "#dateFormat(now()+2, 'DDD')#"
		}>

		<cfexchangecalendar	action		= "create"
							event		= "#stArgs#"
							connection	= "connExch"
							result		= "uid"
		>
	</cfif>

	<cfexchangecalendar	action		= "get"
					    name		= "qMeeting"
					    connection	= "connExch"
	>
		<cfexchangefilter name="subject" value="#URL.label# SUBJECT">
		<cfexchangefilter name="startTime" from="#createDateTime(2009, 3, day(now()), 0, 0, 0)#" to="#createDateTime(2009, month(now())+2, day(now()), 23, 59, 59)#">
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