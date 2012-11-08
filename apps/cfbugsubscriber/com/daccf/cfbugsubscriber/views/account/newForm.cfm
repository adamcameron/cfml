<script type="text/javascript">
	function validateConfirmed(message){
		if (document.getElementById("password").value !== document.getElementById("confirm").value){
			alert(message);
			return false;
		}
		return true;
	}
</script>

<cfif arrayLen(rc.messages)>
	<p>
		Problems with form submission:
		<ul>
		<cfloop array="#rc.messages#" index="prc.message">
			<li><cfoutput>#prc.message#</cfoutput></li>
		</cfloop>
		</ul>	
	</p>
</cfif>
<cfoutput>
	<!---#event.setSESBaseURL("http://#CGI.HTTP_HOST#/#application.appname#")#--->
	#event.buildLink(linkTo='account.save',baseUrl=variables.getSetting("appHomeUrl"))#<br />
	#event.buildLink(linkTo='account.save')#<br />
	
</cfoutput>
<cfform method="post" action="#event.buildLink('account.save')#" <!---onsubmit="return validateConfirmed('#prc.validationMessages.passwordMismatch#')"--->>
	<table>
		<tbody>
			<tr>
				<td><label for="login">Login (email address):</label></td>
				<td><cfinput type="text" name="login" value="" validate="email" <!---required="true" message="#prc.validationMessages.badLogin#"---> /></td>
			</tr>
			<tr>
				<td><label for="password">Password:</label></td>
				<td><cfinput type="password" name="password" id="password" value="" <!---required="true" validate="regex" pattern="#prc.passwordRegex#" message="#prc.validationMessages.badPassword#"---> />(Aa1!aaaaa)</td>
			</tr>
			<tr>
				<td><label for="confirm">Confirm:</label></td>
				<td><cfinput type="password" name="confirm" id="confirm" value="" <!---required="true" validate="regex" pattern="#prc.passwordRegex#" message="#prc.validationMessages.badConfirm#"---> /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Create &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
</cfform>
