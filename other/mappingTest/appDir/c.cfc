<cfcomponent>
	<cffunction name="f" returntype="void">
		<cfdump var="#application#" label="Application scope from calling code">
		<cfreturn>
	</cffunction>
</cfcomponent>