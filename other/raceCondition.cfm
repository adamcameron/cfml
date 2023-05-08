<cfapplication name="raceCondition">

<cfparam name="application.init" default="true">
<cfif application.init>
	<cfset application.init = false>
	<cfset structDelete(application, "msg")>
	<cfset sleep(5000)>
	<cfset application.msg = "Hello World @ #timeFormat(now(), "HH:MM:SS.LLL")#">
</cfif>

<cfoutput>#application.msg#</cfoutput>