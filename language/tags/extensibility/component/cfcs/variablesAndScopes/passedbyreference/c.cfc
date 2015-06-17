<cfcomponent>
	<cffunction name="old">
		<cfreturn />
	</cffunction>

	<cffunction name="transmuter">
		<cfargument name="obj">
		<cfargument name="fn">
		<cfset arguments.obj.new= arguments.fn>
	</cffunction>
</cfcomponent>