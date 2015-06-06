<cfparam name="form.URL" default="">
<cfoutput>
<html>
	<head>
		<title>Browse from Server</title>
		<style>
			body,td	{
				font-family	: verdana, sans-serif;
				font-size	: x-small;
			}
		</style>
	</head>
	<body>
	<form method="post" action="./act.cfm" name="frm1" target="frameBottom">
		URL: <input type="text" name="url" value="#form.url#" size="40" />
		<input type="submit" name="btnSubmit" value="Browse &raquo;" size="40" />
	</form>
</body>
</html>
</cfoutput>