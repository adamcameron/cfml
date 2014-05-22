<!--- FirstDependency.cfc --->
<cfcomponent output="false">

	<cffunction name="methodRequiringGroups1And2" returntype="void" access="public" output="false">
		<cfargument name="group1" type="Group1" required="true">
		<cfargument name="group2" type="Group2" required="true">
	</cffunction>

</cfcomponent>