<cftry>
<cfschedule action="delete" task="cfBugNotifier">
<cfcatch>
	<!---probably didn't exist --->
</cfcatch>
</cftry>
<cfset interval = 2 * 60 * 60><!--- 2h --->
<cfschedule action="update" task="cfBugNotifier" interval="#interval#" operation="HTTPRequest" url="http://adamcameroncoldfusion.cfmldeveloper.com/cfbugnotifier/processBugs.cfm" startdate="#dateFormat(now(), 'm/d/yy')#" starttime="#timeFormat(now(), 'HH:MM')#">