<cfcomponent>

	<cffunction name="f">
		<cfargument name="arg1" default="true">
		<cfset var var1 = "true">
		<cfset arg1 = false>
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#">
	</cffunction>
</cfcomponent>