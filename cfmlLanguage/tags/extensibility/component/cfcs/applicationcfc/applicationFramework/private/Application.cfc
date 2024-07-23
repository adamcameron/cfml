<!---
onApplicationStart (if not run before for this application)
onSessionStart (if not run before for this session)
onRequestStart
onRequest
onRequestEnd

 --->

<cfcomponent output="false">
	<cfset this.name = "testApp">
	<cfset this.applicationTimeout = createTimeSpan(0,2,0,0)>
	<cfset this.clientManagement = true>
	<cfset this.clientStorage = "registry">
	<cfset this.loginStorage = "session">
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,2,0,0)>
	<cfset this.setClientCookies = true>
	<cfset this.setDomainCookies = true>
	<cfset this.scriptProtect = false>


	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		<cfreturn true>
	</cffunction>


	<cffunction name="onSessionStart" returntype="void" output="true">
		<cfdump var="#session#" label="session">
		<cfreturn>
	</cffunction>


	<cffunction name="onRequestStart" returnType="boolean">
		<cfargument type="String" name="targetPage">
		<cfreturn true>
	</cffunction>


	<cffunction name="foo" access="private" output="false" returntype="string" hint="bar">
		<cfreturn "bar">
	</cffunction>


	<cffunction name="bar" access="public" output="false" returntype="string" hint="bar">
		<cfreturn "foo">
	</cffunction>

<cffunction name="testFunc" access="private" returntype="numeric">
<cfreturn 3.141592>
</cffunction>


</cfcomponent>