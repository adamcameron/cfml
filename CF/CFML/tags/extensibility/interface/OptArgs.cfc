<cfcomponent implements="IOptArgs">

	<cffunction name="f" returntype="boolean">
		<cfargument name="reqdArg" type="string" required="true">
		<cfargument name="optArg" type="string" required="false">
		<cfreturn true>
	</cffunction>

</cfcomponent>