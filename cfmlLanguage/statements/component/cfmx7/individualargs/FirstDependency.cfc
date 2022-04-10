<!--- FirstDependency.cfc --->
<cfcomponent output="false">

	<cffunction name="init">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="methodRequiringGroups1And2" access="public" returntype="void" output="false">
		<cfargument name="grouping1Arg1" type="string" required="true">
		<cfargument name="grouping1Arg2" type="string" required="true">
		<cfargument name="grouping1Arg3" type="string" required="true">
		<cfargument name="grouping1Arg4" type="string" required="true">
		<cfargument name="grouping2Arg1" type="string" required="true">
		<cfargument name="grouping2Arg2" type="string" required="true">
		<cfargument name="grouping2Arg3" type="string" required="true">
		<cfargument name="grouping2Arg4" type="string" required="true">
	</cffunction>

</cfcomponent>