<cfcomponent>

	<cffunction name="f" returntype="struct" access="remote">
		<cfargument name="raiseException" type="boolean" required="true">
		
		<cfif arguments.raiseException>
			<cftry>
				<cfthrow>
				<cfcatch>
					Errored
				</cfcatch>
			</cftry>
		<cfelse>
			<cfreturn structNew()>
		</cfif>
	</cffunction>

</cfcomponent>