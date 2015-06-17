<cfcomponent>

	<cfset this.name = "updateSessionTimeout1">
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimespan(0, 0, 0, 10)>

	<cffunction name="onSessionStart">
		<cflog type="info" file="updateSessionTimeout" text="SESSION START @ #timeFormat(now(), 'HH:MM:SS')#">
	</cffunction>
	
	
	<cffunction name="onRequestStart">
		<cfparam name="URL.requestType" default="medium">
		<cfif URL.requestType eq "short">
			<cfset this.sessionTimeout = createTimespan(0, 0, 0, 30)>
		<cfelseif URL.requestType eq "long">
			<cfset this.sessionTimeout = createTimespan(0, 0, 5, 0)>
		<cfelse><!--- eg: medium --->
			<cfset this.sessionTimeout = createTimespan(0, 0, 2, 0)>
		</cfif>
	</cffunction>
	
	
	<cffunction name="onRequest">
		<cfinclude template="#arguments[1]#">
	</cffunction>


	<cffunction name="onSessionEnd">
		<cflog type="info" file="updateSessionTimeout" text="SESSION END @ #timeFormat(now(), 'HH:MM:SS')#">
	</cffunction>


</cfcomponent>