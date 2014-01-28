<cftry>
<cfschedule action="delete" task="cfmlnotifier">
<cfcatch>
	<!---probably didn't exist --->
</cfcatch>
</cftry>
<cfset interval = 2 * 60 * 60><!--- 2h --->
<cfschedule
	action		= "update"
	task		= "cfmlnotifier"
	interval	= "#interval#"
	operation	= "HTTPRequest"
	url			= "http://adamcameroncoldfusion.cfmldeveloper.com/cfmlnotifier/processBugs.cfm"
	startdate	= "#dateFormat(now(), 'm/d/yy')#"
	starttime	= "01:00"
	endtime		= "23:00"
>