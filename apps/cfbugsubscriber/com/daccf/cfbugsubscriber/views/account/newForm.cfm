<cfoutput>#renderView("general/messages")#</cfoutput>
<cfform method="post" action="#event.buildLink('account.create')#" onsubmit="return validateConfirmed('#prc.validationMessages.passwordMismatch#')">
	<table>
		<tbody>
			<tr>
				<td><label for="email">Email address: <span class="required">*</span></label></td>
				<td><cfinput type="text" name="email" value="" validate="email" required="true" message="#prc.validationMessages.badEmail#" /></td>
			</tr>
			<tr>
				<td>
					<label for="password">
						Password: <span class="required">*</span>
						<cftooltip tooltip="Password must be at least eight characters and be mixed case, include a digit and one other non alphanumeric character.">[?]</cftooltip>
					</label>
				</td>
				<td><cfinput type="password" name="password" id="password" value="" required="true" validate="regex" pattern="#prc.passwordRegex#" message="#prc.validationMessages.badPassword#" />(Aa1!aaaaa)</td>
			</tr>
			<tr>
				<td><label for="confirm">Confirm: <span class="required">*</span></label></td>
				<td><cfinput type="password" name="confirm" id="confirm" value="" required="true" message="#prc.validationMessages.passwordMismatch#" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Create &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
</cfform>