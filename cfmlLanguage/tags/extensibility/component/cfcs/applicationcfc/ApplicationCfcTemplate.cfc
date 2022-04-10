<cfcomponent output="false">


	<cfset this.name				= "ApplicationName">
	<cfset this.sessionManagement	= true>


	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		<cfreturn true>
	</cffunction>


	<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="applicationScope" required="true">
	</cffunction>


	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">
		<cfreturn true>
	</cffunction>


	<cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">
		<cfinclude template="#arguments.thePage#">
	</cffunction>



	<cffunction name="onRequestEnd" returnType="void" output="false">
		<cfargument name="thePage" type="string" required="true">
	</cffunction>


	<cffunction name="onSessionStart" returnType="void" output="false">
	</cffunction>


	<cffunction name="onSessionEnd" returnType="void" output="false">
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" type="struct" required="false">
	</cffunction>


	<cffunction name="onMissingTemplate" returnType="boolean" output="false">
		<cfargument name="targetpage" required="true" type="string">
		<cfreturn true>
	</cffunction>


	<cffunction name="onError" returnType="void" output="false">
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">
		<cfthrow object="#arguments.exception#">
	</cffunction>


</cfcomponent>