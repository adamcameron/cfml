<cfcomponent>
	<cffunction name="foo" output="true" access="public">
		<cfargument name="arg1" required="yes">
		<cfargument name="arg2" required="yes">

		<cfoutput>PARENT</cfoutput><br />
		<cfdump var="#arguments#">
		<cfreturn true>
	</cffunction>
	
	<cffunction name="getSuper">
		<cfreturn super>
	</cffunction>
</cfcomponent>