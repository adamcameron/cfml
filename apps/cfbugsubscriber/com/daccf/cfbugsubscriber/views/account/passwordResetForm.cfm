<cfoutput>#renderView("general/messages")#</cfoutput>
<cfform method="post" action="#event.buildLink('account.performPasswordReset')#" onsubmit="return validateConfirmed('#prc.validationMessages.passwordMismatch#')">
	<cfoutput>
		<input type="hidden" name="pwdChangeToken" value="#rc.pwdChangeToken#" />
		<input type="hidden" name="email" value="#rc.email#" />
	</cfoutput>
	<table>
		<tbody>
			<tr>
				<td><label for="password">Password: <span class="required">*</span></label></td>
				<td><cfinput type="password" name="password" id="password" value="" required="true" validate="regex" pattern="#prc.passwordRegex#" message="#prc.validationMessages.badPassword#" /></td>
			</tr>
			<tr>
				<td><label for="confirm">Confirm: <span class="required">*</span></label></td>
				<td><cfinput type="password" name="confirm" id="confirm" value="" required="true" message="#prc.validationMessages.passwordMismatch#" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Reset &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
</cfform>