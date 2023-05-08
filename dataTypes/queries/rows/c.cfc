<cfcomponent>

	<cffunction name="f">
		<cfargument name="q" type="query" required="yes">
		<cfreturn arguments.q.currentRow>
	</cffunction>

</cfcomponent>