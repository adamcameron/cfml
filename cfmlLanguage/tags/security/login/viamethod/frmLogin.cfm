<cfparam name="form.j_username" default="">
<cfparam name="form.j_password" default="">

<cfif structKeyExists(form, "btnLogout")>
	<cflogout>
	USER LOGGED OUT<br />
	<cfset form.j_username = "">
	<cfset form.j_password = "">
<cfelse>
	<cfif CGI.request_method EQ "post" AND structKeyExists(form, "j_username") AND structKeyExists(form, "j_password")>
		<cfif isUserLoggedIn()>
			<cflogout>
		</cfif>
		<cfif len(form.j_username) AND form.j_username eq form.j_password>
			<cflogin>
				<cfswitch expression="#form.j_username#">
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
				<cfif structKeyExists(variables, "lRoles")>
					<cfloginuser name="#form.j_username#" password="#form.j_password#" roles="#lRoles#">
				<cfelse>
					USER NOT AUTHORISED<br/>
				</cfif>
			</cflogin>
		<cfelse>
			INVALID LOGIN CREDENTIALS<br />	
		</cfif>
	</cfif>
</cfif>

<cfif isUserLoggedIn()>
	<cfset stUser = {
		name 	= getAuthUser(),
		roles	= getUserRoles()
	}>
	<cfdump var="#stUser#" label="LOGGED IN">
<cfelse>
	NOT LOGGED IN<br />
</cfif>
<hr />

<form method="post" action="./frmLogin.cfm">
	<table>
		<tr>
			<td>Login ID</td>
			<td><input type="text" name="j_username" value="<cfoutput>#form.j_username#</cfoutput>" /></inout></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="j_password" value="<cfoutput>#form.j_password#</cfoutput>" /></inout></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<cfif isUserLoggedIn()>
					<input type="submit" name="btnLogout" value="Logout" />
				</cfif>
				<input type="submit" name="btnLogin" value="Login" />
			</td>
		</tr>
	</table>
</form>
