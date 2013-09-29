<cftry>
<cfschedule action="delete" task="bugUpdates">
<cfcatch>
	<!---probably didn't exist --->
</cfcatch>
</cftry>
<cfset interval = 6 * 60 * 60><!--- 6h --->
<cfschedule action="update" task="bugUpdates" interval="#interval#" operation="HTTPRequest" url="http://adamcameroncoldfusion.cfmldeveloper.com/bugUpdates/processBugs.cfm" startdate="#dateFormat(now(), 'm/d/yy')#" starttime="#timeFormat(now(), 'HH:MM')#">