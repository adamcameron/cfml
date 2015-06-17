<cfcomponent output="false">


	<cfset this.name				= "variableAvailability">
	<cfset this.sessionManagement	= true>


	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">

		<cfset variables.foo = "bar">
		<cfreturn true>
	</cffunction>


	<cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">
		<cfinclude template="#arguments.thePage#">
	</cffunction>


</cfcomponent>