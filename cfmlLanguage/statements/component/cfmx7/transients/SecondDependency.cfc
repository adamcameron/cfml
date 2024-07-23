<!--- SecondDependency.cfc --->
<cfcomponent output="false">

	<cffunction name="init">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="methodRequiringAllArgs" returntype="void" access="public" output="false">
		<cfargument name="group1" type="Group1" required="true">
		<cfargument name="group2" type="Group2" required="true">
		<cfargument name="group3" type="Group3" required="true">
		<cfargument name="group4" type="Group4" required="true">

	</cffunction>

</cfcomponent>