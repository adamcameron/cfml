<cfparam name="form.j_username" default="">
<cfparam name="form.j_password" default="">

<form method="post" action="./inCfm.cfm">
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