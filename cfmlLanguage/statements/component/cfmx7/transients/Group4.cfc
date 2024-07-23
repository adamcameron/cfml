<!--- Group4.cfc --->
<cfcomponent output="false">

	<cffunction name="init" returntype="Group4" access="public">
		<cfargument name="property1" required="false" default="property1default">
		<cfargument name="property2" required="false" default="property2default">
		<cfargument name="property3" required="false" default="property3default">
		<cfargument name="property4" required="false" default="property4default">

		<cfset variables.property1 = arguments.property1>
		<cfset variables.property2 = arguments.property2>
		<cfset variables.property3 = arguments.property3>
		<cfset variables.property4 = arguments.property4>
		<cfreturn this>
	</cffunction>
	
</cfcomponent>