<cfscript>
param name="variables.message"	default="";
param name="URL.from"			default="../";	
param name="form.from"			default=URL.from;	
	
if (structKeyExists(form, "email") && structKeyExists(form, "password")){
	variables.user = entityLoad("User",  {email=form.email, password=hash(form.password), active=true}, true);
	if (structKeyExists(variables, "user")){
		session.loggedIn = true;
		location(form.from, false);
	}else{
		variables.message = "Login failed. Please try again. Please note you must have activated your login before you can use it.";
	}
}
</cfscript>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Login</title>
</head>
<body>
<cfoutput>
<cfif len(variables.message)>
	<p>#variables.message#</p>
</cfif>
<p>	
Enter login details:
<form method="post" action="#CGI.script_name#">
<input type="hidden" name="from" value="#URL.from#" />
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
</p>
</cfoutput>
<br />
Or
<ul>
	<li><a href="./create.cfm">Create an account</a></li>
	<li><a href="./revalidate.cfm">Revalidate your account</a> (if you have lost your validation email)</li>
	<li><a href="./passwordChange.cfm">Request password reset</a> (if you have forgotten your password)</li>
</ul>
</body>
</html>