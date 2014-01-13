<cfloop index="version" array="#[9,10]#">
	<cftry>
	<cfset taskName = "CF#version#BugCount">
	<cfschedule action="delete" task="#taskName#">
	<cfoutput>Existing #taskName# task deleted<br></cfoutput>
	<cfcatch>
		<!---probably didn't exist --->
		<cfoutput>Error deleting #taskName# task<br></cfoutput>
		<cfdump var="#cfcatch#">
	</cfcatch>
	</cftry>
	<cfset interval = 24 * 60 * 60><!--- 24h --->
	<cfset startDate = dateAdd("d", 1, now())>
	<cfset scheduleArgs = {
		action		= "update",
		task		= taskName,
		interval	= interval,
		operation	= "HTTPRequest",
		url			= "http://adamcameroncoldfusion.cfmldeveloper.com/cfbugs/countUnTriagedCf#version#Bugs.cfm",
		startdate	= dateFormat(startDate, 'm/d/yy'),
		starttime	= "00:00"
	}>
	<cfschedule	attributecollection="#scheduleArgs#">
	<cfoutput>#taskName# task rescheduled<br></cfoutput>
	<cfdump var="#scheduleArgs#">
</cfloop>