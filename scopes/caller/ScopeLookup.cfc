<cfcomponent>

	<cffunction name="f" output="true">
		<cfargument name="a" required="true">
		<cfset var st = getPageContext().getActiveFunctionLocalScope()>
		<cfdump var="#arguments#" label="arguments">
		<cfset structDelete(st, "a")>
		<!--- <cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope()"> --->
		<cfdump var="#arguments#" label="arguments">
		<cfoutput>a: [#a#]<br /></cfoutput>
	</cffunction>
</cfcomponent>