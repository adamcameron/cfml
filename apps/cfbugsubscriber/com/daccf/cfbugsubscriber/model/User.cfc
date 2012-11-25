<cfcomponent output="false">

		
	<cfimport path="com.daccf.cfbugsubscriber.orm.*"> 

	
	<cffunction name="authorise" returntype="numeric" access="public" hint="Logs-in the user. Returns the ID of the authorised user, or zero if authorisation failed.">
		<cfargument name="email"	type="string"	required="true" hint="User's login ID">
		<cfargument name="password"	type="string"	required="true" hint="User's password">

		<cfset var user = false>
		<cfset var result = 0>
		<cfset var loginArgs = {
			email	= arguments.email,
			password= hash(arguments.password),
			active	= 1
		}>
		<cflogout>
		<cflogin>
			<cfset user = entityLoad("Account", loginArgs, true)>
			<cfif structKeyExists(local, "user")>
				<cfloginuser name="#arguments.email#" password="#arguments.password#" roles="user">
				<cfset result = user.getId()>
			</cfif>
		</cflogin>
		<cfreturn result>
	</cffunction>
	
	
	<cffunction name="logout" returntype="void" access="public" hint="Logs-out the user">
		<cflogout>
	</cffunction>


	<cfscript>
		/**
		@hint Verifies a user via ID and password.
		*/
		public boolean function authenticate(required numeric id, required string password){
			var user = entityLoad(
				"Account", 
				{
					id		= arguments.id,
					password= hash(arguments.password),
					active	= 1
				},
				true
			);
			return structKeyExists(local, "user");
		}
	</cfscript>

	
</cfcomponent>