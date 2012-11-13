<cfcomponent output="false">
	
	<cfimport path="com.daccf.cfbugsubscriber.orm.*"> 
	
	<cffunction name="authorise" returntype="boolean" access="public" hint="Logs-in the user">
		<cfargument name="email"	type="string"	required="true" hint="User's login ID">
		<cfargument name="password"	type="string"	required="true" hint="User's password">

		<cfset var user = false>
		<cfset var authorised = false>
		<cfset var loginArgs = {
			email	= arguments.email,
			password= hash(arguments.password),
			active=1
		}>
		<cflogout>
		<cflogin>
			<cfset user = entityLoad("Account", loginArgs, true)>
			<cfif structKeyExists(local, "user")>
				<cfloginuser name="#arguments.email#" password="#arguments.password#" roles="user">
				<cfset authorised = true>
			</cfif>
		</cflogin>
		<cfreturn authorised>
	</cffunction>
	
	<cffunction name="logout" returntype="void" access="public" hint="Logs-out the user">
		<cflogout>
	</cffunction>
	
</cfcomponent>