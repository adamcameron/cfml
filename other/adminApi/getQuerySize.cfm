<cfquery name="q" datasource="cfartgallery">
	SELECT	*
	FROM	artists
</cfquery>
<cfdump var="#q#">

<cfset oAdmin = createObject("component", "cfide.adminapi.administrator")>
<cfset oAdmin.login("pwd", "adminapi")>

<cfset oMonitor = createObject("component", "cfide.adminapi.servermonitoring")>
<cfset aMetrics = oMonitor.getQueryDetails()>
<cfdump var="#aMetrics#">