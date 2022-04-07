<cfcomponent>

	<cffunction name="login" returntype="struct" access="public">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">

		<cfset var lRoles = "">
		<cfset var stUser = {}>

		<cfif isUserLoggedIn()>
			<cflogout>
		</cfif>
		<cfif len(arguments.username) AND arguments.username eq arguments.password>
			<cflogin>
				<cfswitch expression="#arguments.username#">
					<cfcase value="admin">
						<cfset lRoles = "admin,write,read">
					</cfcase>
					<cfcase value="write">
						<cfset lRoles = "write,read">
					</cfcase>
					<cfcase value="read">
						<cfset lRoles = "read">
					</cfcase>
				</cfswitch>
				<cfif len(lRoles)>
					<cfloginuser name="#arguments.username#" password="#arguments.password#" roles="#lRoles#">
				</cfif>
			</cflogin>
		</cfif>
		<cfset stUser.loggedin	= isUserLoggedIn()>
		<cfset stUser.user		= getAuthUser()>
		<cfset stUser.roles		= getUserRoles()>
		<cfreturn stUser>
	</cffunction>
	
</cfcomponent>