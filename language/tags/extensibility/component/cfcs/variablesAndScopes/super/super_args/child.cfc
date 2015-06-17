<cfcomponent extends="parent">
	<cffunction name="f" output="true" returntype="boolean">
		<cfargument name="a" required="yes">
		CHILD<br />
		<cfreturn super.f(argumentCollection=arguments)>
	</cffunction>
</cfcomponent>