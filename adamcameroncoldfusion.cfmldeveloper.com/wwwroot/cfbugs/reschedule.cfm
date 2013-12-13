<cftry>
<cfset taskName = "CF10BugCount">
<cfschedule action="delete" task="#taskName#">
<cfcatch>
	<!---probably didn't exist --->
</cfcatch>
</cftry>
<cfset interval = 6 * 60 * 60><!--- 6h --->
<cfschedule action="update" task="#taskName#" interval="#interval#" operation="HTTPRequest" url="http://adamcameroncoldfusion.cfmldeveloper.com/cfbugs/countUnTriagedCf10Bugs.cfm" startdate="#dateFormat(now(), 'm/d/yy')#" starttime="#timeFormat(now(), 'HH:MM')#">