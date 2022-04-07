<cfcomponent extends="base">
	<cffunction name="f">
		<cfdump var="#arguments#" label="extend.f arguments">
		<cfset super.f(argumentCollection=arguments)>
	</cffunction>

	<cffunction name="g">
		<cfargument name="arg1">
		<cfargument name="arg2">
		<cfargument name="arg3">
		<cfdump var="#arguments#" label="extend.g arguments">
		<cfset super.g(argumentCollection=arguments)>
	</cffunction>

	<cffunction name="h">
		<cfargument name="arg1">
		<cfargument name="arg2">
		<cfargument name="arg3">
		<cfdump var="#arguments#" label="extend.g arguments">
		<cfset super.g(argumentCollection=arguments)>
	</cffunction>

</cfcomponent>