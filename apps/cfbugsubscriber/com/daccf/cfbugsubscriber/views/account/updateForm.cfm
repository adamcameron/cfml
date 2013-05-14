<cfoutput>
#renderView("general/messages")#
<cfform method="post" action="#event.buildLink('account.update')#" onsubmit="return validateConfirmed('#prc.validationMessages.passwordMismatch#')">
	<input type="hidden" name="id" value="#getPlugin('SessionStorage').getVar('id')#" />
	<table>
		<tbody>
			<tr>
				<td><label for="email">Email address:</label></td>
				<td><cfinput type="text" name="email" value="" validate="email" required="true" message="#prc.validationMessages.badEmail#" /></td>
			</tr>
			<tr>
				<td><label for="currentPassword">Current password: <span class="required">*</span></label></td>
				<td><cfinput type="password" name="currentPassword" id="currentPassword" value="" required="true" validate="regex" pattern="#prc.passwordRegex#" message="#prc.validationMessages.badPassword#" />(Aa1!aaaaa)</td>
			</tr>
			<tr>
				<td>
					<label for="password">
						New password:
						<cftooltip tooltip="Password must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.">[?]</cftooltip>
					</label>
				</td>
				<td><cfinput type="password" name="password" id="password" value="" required="true" validate="regex" pattern="#prc.passwordRegex#" message="#prc.validationMessages.badPassword#" /></td>
			</tr>
			<tr>
				<td><label for="confirm">Confirm new password:</label></td>
				<td><cfinput type="password" name="confirm" id="confirm" value="" required="true" message="#prc.validationMessages.passwordMismatch#" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Update &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
</cfform>
</cfoutput>