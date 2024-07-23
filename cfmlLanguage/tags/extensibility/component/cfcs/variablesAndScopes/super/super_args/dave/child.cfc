<cfcomponent extends="parent">
	<cffunction name="foo" output="true">
		<cfargument name="arg1">
		<cfargument name="arg2">
		
		<cfoutput>CHILD</cfoutput><br />
		<cfdump var="#arguments#">
		<!--- <cfdump var="#getMetadata(this)#"> --->
		<cfreturn getSuper().foo(argumentCollection=arguments)>
		
	</cffunction>
</cfcomponent>