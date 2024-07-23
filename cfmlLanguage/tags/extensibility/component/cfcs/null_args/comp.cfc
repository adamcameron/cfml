<cfcomponent>
	<cffunction name="func" output="true">
		<cfargument name="arg" required="no">
		
		<cfif isDefined("arguments[1]")>
			It does
		<cfelse>
			It doesn't
		</cfif>
		
	</cffunction>

	<cffunction name="func2" output="true">
		<cfargument name="arg" required="yes">
		<cfdump var="#arguments#">
	</cffunction>
</cfcomponent>

