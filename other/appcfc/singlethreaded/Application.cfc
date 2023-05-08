<!--- Application.cfc --->
<cfcomponent>
	
	<cfset this.name				= "singleThreadedAppStart4">
	<cfset this.applicationTimeout	= createTimeSpan(0,0,0,30)>
	
	<cffunction name="onApplicationStart">
		<cfset application.startTick = getTickCount()>
		<cflog file="#this.name#" text="[#getTickCount()-application.startTick#] Top of onApplicationStart() called via #CGI.script_name#">
		<cfset application.startedBy = CGI.script_name>
		<cfset sleep(10000)>
		<cflog file="#this.name#" text="[#getTickCount()-application.startTick#] Bottom of onApplicationStart() called via #CGI.script_name#">
	</cffunction>

	<cffunction name="onRequestStart">
		<cflog file="#this.name#" text="[#getTickCount()-application.startTick#] Top of onRequestStart() called via #CGI.script_name#">
		<cfif structKeyExists(URL,  "restart")>
			<cfset onApplicationStart()>
		</cfif>
		<cflog file="#this.name#" text="[#getTickCount()-application.startTick#] Bottom of onRequestStart() called via #CGI.script_name#">
	</cffunction>

</cfcomponent>