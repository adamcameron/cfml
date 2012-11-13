<cfform method="post" action="#event.buildLink('account.sendResetRequest')#">
	<table>
		<tbody>
			<tr>
				<td><label for="email">Email address:</label></td>
				<td><cfinput type="text" name="email" value="" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Create &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
</cfform>