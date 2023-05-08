<!--- Group2.cfc --->
<cfcomponent output="false">

	<cffunction name="init" returntype="Group2" access="public">
		<cfargument name="property1" required="true">
		<cfargument name="property2" required="true">
		<cfargument name="property3" required="true">
		<cfargument name="property4" required="true">

		<cfset variables.property1 = arguments.property1>
		<cfset variables.property2 = arguments.property2>
		<cfset variables.property3 = arguments.property3>
		<cfset variables.property4 = arguments.property4>
		<cfreturn this>
	</cffunction>
	
</cfcomponent>