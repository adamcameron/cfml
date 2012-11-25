<cfoutput>#renderView("general/messages")#</cfoutput>
<cfform method="post" action="#event.buildLink('account.sendResetRequest')#">
	<table>
		<tbody>
			<tr>
				<td><label for="email">Email address:</label></td>
				<td><cfinput type="text" name="email" value="" size="50" validate="email" required="true" message="#prc.validationMessages.badEmail#" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Send &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
</cfform>