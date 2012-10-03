<cfscript>
variables.validationMessages = {
	noEmail			= "You need to provide an email address",
	noPassword		= "You need to provide a password",
	passwordMismatch= "Password mismatch"
};
	
if (structKeyExists(form, "email") && structKeyExists(form, "password") && structKeyExists(form, "confirmpassword")){
	if (!len(form.email)){
		variables.message = variables.validationMessages.noEmail;
	}else if (!len(form.password)){
		variables.message = variables.validationMessages.noPassword;
	}else if (compare(form.password, form.confirmPassword)){	// remember non-zero is a FAIL here
		variables.message = variables.validationMessages.passwordMismatch;
	}else{
	//	try {
			param name="form.name" default="";
			newUser = new User(email=form.email, password=form.password, name=form.name);
			entitySave(newUser);
			mailer = new Mailer();
			mailer.sendActivation(email=newUser.getEmail(), activationToken=newUser.getActivationToken());
			variables.message = "Account created.  An email has been sent to your email address, use the URL in it to validate & activate your account.";
//		}
//		catch (any e){
			// probably the result of a duplicate user
//			variables.message = "Error creating user account. This is most likely because the email address already has an account. Please either login with that email address, or create an account with a different email address";
//		}
	}
}
param name="variables.message" default="";
</cfscript>
<cfoutput>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Create Account</title>
	
	<script>
		function validateForm(){
			if (!document.getElementById("email").value.length){
				alert("#variables.validationMessages.noEmail#");
				return false;
			}
			if (!document.getElementById("password").value.length){
				alert("#variables.validationMessages.noPassword#");
				return false;
			}
			if (document.getElementById("password").value != document.getElementById("confirmPassword").value){
				alert("#variables.validationMessages.passwordMismatch#");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<cfif len(variables.message)>
	<p>#variables.message#</p>
</cfif>
<p>	
Enter account details:
<form method="post" action="#CGI.script_name#" onsubmit="return validateForm()">
<table>
	<tr>
		<td>Name:</td>
		<td><input type="text" name="name" value="" /></td>
	</tr>
	<tr>
		<td colspan="2">If this matches your name on the Adobe bugbase, You'll be able to associate your bugs to this account</td>
	</tr>
	<tr>
		<td colspan="2"><hr /></td>
	</tr>
	<tr>
		<td>Email (this will be your login) (*):</td>
		<td><input type="text" name="email" id="email" value="" /></td>
	</tr>
	<tr>
		<td>Password (*):</td>
		<td><input type="password" name="password" id="password" value="" /></td>
	</tr>
	<tr>
		<td>Confirm password (*):</td>
		<td><input type="password" name="confirmPassword" id="confirmPassword" value="" /></td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" name="btnSubmit" value="Create Account" /></td>
	</tr>
</table>
</form>
</p>
</cfoutput>
</body>
</html>