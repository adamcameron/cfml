<cfcomponent output="false">


	<cfset this.name = "parseErrors">




	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">

		<cferror type="request" template="./error.cfm">>

		<cfreturn true>
	</cffunction>

<!---
	<cffunction name="onError" returnType="void" output="false">
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">

		<cfdump var="#arguments.exception#" label="#arguments.eventname#">
		<cfabort>
	</cffunction> --->


</cfcomponent>