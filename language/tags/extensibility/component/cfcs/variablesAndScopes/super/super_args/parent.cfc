<cfcomponent>
	<cffunction name="f" output="true" returntype="boolean">
		<cfargument name="a" required="yes">
		PARENT<br />
		<cfdump var="#arguments#">
		<cfreturn true>
	</cffunction>
</cfcomponent>