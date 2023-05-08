<cfcomponent output="true">
	
	<cfset this.name = "testMappings2">
	<cfset this.sessionManagement = true>
	<cfset this.applicationTimeout	= createTimespan(0,0,0,20)>
	<cfset this.sessionTimeout		= createTimespan(0,0,0,10)>
	
	<cfset this.mappings = structNew()>
	<cfset this.mappings["/test"] = "C:\temp">
	
	<cfset testExpandPath("Pseudoconstructor")>
	
	<cffunction name="onApplicationStart" returnType="boolean" output="true">
		<cfset testExpandPath("onApplicationStart")>
		<cfreturn true>
	</cffunction>

	<cffunction name="onApplicationEnd" returnType="void" output="true">
		<cfargument name="applicationScope" required="true">
		<cfset testExpandPath("onApplicationEnd")>
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="boolean" output="true">
		<cfargument name="thePage" type="string" required="true">
		<cfset testExpandPath("onRequestStart")>
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">
		<cfset testExpandPath("onRequest")>
		<cfinclude template="#arguments.thePage#">
	</cffunction>

	<cffunction name="onRequestEnd" returnType="void" output="true">
		<cfargument name="thePage" type="string" required="true">
		<cfset testExpandPath("onRequestEnd")>
	</cffunction>

	<cffunction name="onSessionStart" returnType="void" output="true">
		<cfset testExpandPath("onSessionStart")>
	</cffunction>

	<cffunction name="onSessionEnd" returnType="void" output="true">
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" type="struct" required="false">
		<cfset testExpandPath("onSessionEnd")>
	</cffunction>


	<cffunction name="testExpandPath" returntype="void" access="public" output="true">
		<cfargument name="message" required="true" type="string">

		<cfset var path  = expandPath("/test")>
		<cfset var fullMessage = "#message#: #path#">
		<cfoutput>#fullMessage#<br /></cfoutput>
		<cflog file="testMappings2" text="#fullMessage#">
	</cffunction>

</cfcomponent>