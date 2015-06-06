<cfcomponent>
	<cffunction access="remote" name="sayHello" output="false" returntype="string" hint="Says hello">
		<cfargument name="dbConnection" type="struct" required="yes" hint="DSN details">
		
		<cfreturn "Hallo Wurld">
	</cffunction>
</cfcomponent>