<cfcomponent rest="true">
	
	<cffunction
		name		= "login"
		returntype	= "struct"
		access		= "remote"
		output		= "false"
		produces	= "text/xml"
		restpath	= "login"
		httpmethod	= "post"
	>
		<cfargument name="username" type="string" required="true" restargsource="form">
		<cfargument name="password" type="string" required="true" restargsource="form">

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
	
	
	<cffunction
		name		= "needsAdminAccess"
		returntype	= "boolean"
		access		= "remote"
		output		= "false"
		produces	= "text/plain"
		restpath	= "needsAdminAccess"
		httpmethod	= "get"
		roles		= "admin"
	>
		<cfreturn true>	
	</cffunction>


</cfcomponent>