<cfcomponent>

	<cffunction name="f">
		<cfinclude template="i.cfm">
	</cffunction>
	
	<cffunction name="getVariables" returntype="struct">
		<cfreturn variables>
	</cffunction>
</cfcomponent>