<cfcomponent output="false" hint="Proxy test">


	<cffunction name="authenticate" returntype="boolean" access="remote" output="false" hint="Authenticates a user.">
		<cfargument name="userId" type="string" required="true" hint="User ID to authenticate.">
		<cfargument name="password" type="string" required="true" hint="Password to authenticate with.">

		<cfreturn	(arguments.userId eq "adam" and arguments.password eq "123")
			or		(arguments.userId eq "admin" and arguments.password eq "admin")
			or		(arguments.userId eq "guest" and arguments.password eq "")
		>
	</cffunction>


</cfcomponent>