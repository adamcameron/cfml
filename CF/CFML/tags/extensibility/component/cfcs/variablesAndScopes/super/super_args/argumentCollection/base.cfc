<cfcomponent>
	<cffunction name="f">
		<cfdump var="#arguments#" label="base.f arguments">
	</cffunction>

	<cffunction name="g">
		<cfdump var="#arguments#" label="base.f arguments">
	</cffunction>

	<cffunction name="h">
		<cfargument name="arg1">
		<cfargument name="arg2">
		<cfargument name="arg3">
		<cfdump var="#arguments#" label="base.f arguments">
	</cffunction>

</cfcomponent>