<!--- SecondDependency.cfc --->
<cfcomponent output="false">

	<cffunction name="init">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="methodRequiringAllArgs" returntype="void" access="public" output="false">
		<cfargument name="group1" type="struct" required="true">
		<cfargument name="group2" type="struct" required="true">
		<cfargument name="group3" type="struct" required="true">
		<cfargument name="group4" type="struct" required="true">

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
		<cfif NOT structKeyExists(arguments.group3, "property1")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group3, "property2")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group3, "property3")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group3, "property4")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group4, "property1")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group4, "property2")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group4, "property3")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
		<cfif NOT structKeyExists(arguments.group4, "property4")>
			<cfthrow type="InvalidArgumentException">
		</cfif>
	</cffunction>
	
</cfcomponent>