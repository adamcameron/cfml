<cfscript>
	param name="form.email" default="";
	param name="form.password" default="";

	if (structKeyExists(form, "btnSubmit")){
		newAccount = new Account();
		newAccount.setEmail(form.email);
		newAccount.setPassword(form.password);
		try {
			entitySave(newAccount);
			mailer = new Mailer();
			mailer.sendActivation(email=newAccount.getEmail(), activationToken=newAccount.getActivationToken());
			status = true;
		} catch (any e){
			status = false;
		}
	}
	param name="variables.status" default=true;
</cfscript>
<cfoutput>
<cfif not status>
	There was an error when creating that account: it possible already exists. Please use a different email address.<br /><br />
</cfif>
<form method="post" action="#CGI.script_name#">
	<table>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email" vaule="#form.email#" /></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" vaule="#form.password#" /></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="submit" name="btnSubmit" vaule="Submit" />
			</td>
		</tr>
	</table>

</form>
</cfoutput>
