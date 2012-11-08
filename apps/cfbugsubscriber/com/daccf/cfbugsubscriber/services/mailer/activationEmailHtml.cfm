<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Bug notifier email validation</title>
</head>
<cfoutput>
<body>
	<p>
		You have received this email because it was used to create a login account for #email#.
	</p>
	<p>
		Please browse to this URL to validate your email address: <a href="#fullUrl#">#fullUrl#</a>
	</p>
</body>
</cfoutput>
</html>