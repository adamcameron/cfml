<form action="http://www.ru.msf.org/shadomx/shado_central/index.cfm?shadoaction=login" method="post" name="loginForm" onSubmit="return checkForm();">
	<tr valign="middle">
		<td align="left"><strong>Username:</strong></td>
		<td align="left">
			<input name="username" type="text" value="" maxlength="50" />

		</td>
	</tr>
	<tr valign="middle">
		<td align="left"><strong>Password:</strong></td>
		<td align="left">
			<input name="password" type="text" value="" maxlength="20" />
		</td>
	</tr>

	<tr valign="middle">
		<td align="left"><strong>Site:</strong></td>
		<td align="left">
			<input name="site" type="text" value="" maxlength="100" />
		</td>
	</tr>
	<tr valign="middle">
		<td colspan="2" align="right">


			<input type="hidden" name="loginType" value="LDAP" />
			<input type="submit" name="submitButton" value="Enter" class="stdbutton" />
		</td>
	</tr>
</form>