<cfcomponent output="false">

	<cffunction name="f" access="remote" returntype="string" output="false">
		<cfargument name="s" required="true" type="string">
		<cfreturn reverse(arguments.s)>
	</cffunction>

</cfcomponent>