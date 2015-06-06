<cflog application="true" file="appStartUp" type="information" text="Server started">

<cfthread name="startApp1" action="run">
	<cfhttp url="http://shared.local/cf/other/scheduledTasks/startup/app1/?bootstraponly=true" method="get" />
	<cflog application="true" file="appStartUp" type="information" text="App1 started">
</cfthread>

<cfthread name="startApp2" action="run">
	<cfhttp url="http://shared.local/cf/other/scheduledTasks/startup/app2/?bootstraponly=true" method="get" />
	<cflog application="true" file="appStartUp" type="information" text="App2 started">
</cfthread>

<cfthread name="startApp3" action="run">
	<cfhttp url="http://shared.local/cf/other/scheduledTasks/startup/app3/?bootstraponly=true" method="get" />
	<cflog application="true" file="appStartUp" type="information" text="App3 started">
</cfthread>
<!---
<cfschedule task="Server Startup" action="delete">
<cfschedule operation="HTTPRequest" task="Server Startup" interval="once" startdate="#dateAdd('d',-1,now())#" url="http://shared.local/cf/other/scheduledTasks/startup/onServerStart.cfm" action="update" starttime="#dateAdd('d',-1,now())#">
--->
<cflog application="true" file="appStartUp" type="information" text="Bootstrap complete">

<cfset d = dateAdd("d",now(),-1)>

<cfschedule>