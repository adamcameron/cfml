<cfcomponent>

	<cffunction name="f" access="remote" returntype="xml">
		<cfargument name="x" type="xml" required="true">

		<cfset var a = xmlSearch(arguments.x, "//bbb")>
		<cfset a[1].xmlChildren[1] = xmlElemNew(arguments.x, "ddd")>
		<cfset a[1].xmlChildren[1].xmlText = "eee">
		<cfreturn arguments.x>
	</cffunction>

</cfcomponent>