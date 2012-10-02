<cfscript>
if (structKeyExists(form, "email" && structKeyExists(form, "password"))){
	try {
		user = new User(email=form.email, password=form.password);
		entitySave(user);
	}
	catch (any e){
		// probably the result of a duplicate user
		message = "Error creating user account. This is most likely because the email address already has an account. Please either login with that email address, or create an account with a different email address";
	}
	
}
</cfscript>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Create Account</title>
</head>
<body>
Enter login details:
<cfoutput>
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
		<td colspan="2" align="right"><input type="submit" name="btnSubmit" value="Login" /></td>
	</tr>
</table>
</form>
</cfoutput>
<br />
Or <a href="./create.cfm">create an account</a>
</body>
</html>