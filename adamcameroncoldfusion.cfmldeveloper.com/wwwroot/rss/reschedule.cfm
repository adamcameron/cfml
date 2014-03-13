<cftry>
<cfschedule action="delete" task="rss">
<cfcatch>
	<!---probably didn't exist --->
</cfcatch>
</cftry>
<cfset interval = 1 * 60 * 60><!--- 1h --->
<cfschedule
	action		= "update"
	task		= "cfmlnotifier"
	interval	= "#interval#"
	operation	= "HTTPRequest"
	url			= "http://adamcameroncoldfusion.cfmldeveloper.com/rss/processFeed.cfm"
	startdate	= "#dateFormat(now(), 'm/d/yy')#"
	starttime	= "00:00"
	endtime		= "23:00"
>