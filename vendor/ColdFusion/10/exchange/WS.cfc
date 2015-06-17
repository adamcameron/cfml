<cfcomponent>
	
	<cffunction name="good" returntype="struct" access="remote">
		<cfset var stReturn = {status=true, firstname="foo", lastName="Bar"}>
		<cfreturn stReturn>
	</cffunction>
	
	<cffunction name="bad" returntype="struct" access="remote">
		<cfreturn {status=false, message="It didn't work", detail="because it failed"}>
	</cffunction>
	
	<cffunction name="ugly" returntype="struct" access="remote">
		<cfthrow type="SomeException">
	</cffunction>
	
</cfcomponent>