<cfscript>
if (structKeyExists(form, "email")){
	variables.account = entityLoad("Account",  {email=form.email, password=hash(form.password)}, true);
	if (structKeyExists(variables, "Account")){
		variables.mailer = new Mailer();
		variables.email = variables.account.getEmail();
		variables.mailer.sendActivation(email=variables.email, activationToken=variables.account.getActivationToken());
		variables.message = "A revalidation email has been sent to #variables.email#.";
	}else{
		variables.message = "Could not authenticate credentials. Please try again.";
	}
}

param name="variables.message"	default="";
</cfscript>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Revalidate Account</title>
</head>
<body>
<cfoutput>
<cfif len(variables.message)>
	<p>#variables.message#</p>
</cfif>
<p>	
Enter login details:
<form method="post" action="#CGI.script_name#">
<table>
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" value="" /></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password" value="" /></td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" name="btnSubmit" value="Revalidate" /></td>
	</tr>
</table>
</form>
</cfoutput>
</p>
</body>
</html>