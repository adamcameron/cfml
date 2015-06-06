<cfcomponent extends="parent">
	<cffunction name="init">
		<cfargument name="arg">
		child.init()<br />
		<!--- <cfset super.init(arg=arguments.arg)> --->
		<cfset super.f(arg=arguments.arg)>
	</cffunction>
</cfcomponent>