<!--- FirstDependency.cfc --->
<cfcomponent output="false">

	<cffunction name="methodRequiringGroups1And2" returntype="void" access="public" output="false">
		<cfargument name="group1" type="struct" required="true">
		<cfargument name="group2" type="struct" required="true">

		<cfif NOT structKeyExists(arguments.group1, "property1")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group1, "property2")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group1, "property3")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group1, "property4")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group2, "property1")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group2, "property2")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group2, "property3")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group2, "property4")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
	</cffunction>
	
</cfcomponent>