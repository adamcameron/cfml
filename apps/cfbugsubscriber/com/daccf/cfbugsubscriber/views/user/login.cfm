<cfoutput>#renderView("general/messages")#</cfoutput>
<cfform method="post" action="#event.buildLink('user.authorise')#">
	<table>
		<tbody>
			<tr>
				<td><label for="email">Email address:</label></td>
				<td><cfinput type="text" name="email" value="" /></td>
			</tr>
			<tr>
				<td><label for="password">Password:</label></td>
				<td><cfinput type="password" name="password" value="" />(Aa1!aaaaa)</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" name="btnSubmit" value="Login &raquo;" />
				</td>
			</tr>
		</tbody>
	</table>
	<cfoutput>
		<ul>
			<li><a href="#event.buildLink('account.requestPasswordReset')#">Request password reset</a></li>			
			<li><a href="#event.buildLink('account.create')#">Create an account</a></li>	
		</ul>
	</cfoutput>
</cfform>