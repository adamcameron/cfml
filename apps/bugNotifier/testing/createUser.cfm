<cfscript>
	param name="form.email" default="";
	param name="form.password" default="";

	if (structKeyExists(form, "btnSubmit")){
		newUser = new User();
		newUser.setEmail(form.email);
		newUser.setPassword(form.password);
		try {
			entitySave(newUser);
			mailer = new Mailer();
			mailer.sendValidation(email=newUser.getEmail(), validationToken=newUser.getValidationToken());
			status = true;
		} catch (any e){
			status = false;
		}
	}
	param name="variables.status" default=true;
</cfscript>
<cfoutput>
<cfif not status>
	There was an error when creating that user: it possible already exists. Please use a different email address.<br /><br />
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
