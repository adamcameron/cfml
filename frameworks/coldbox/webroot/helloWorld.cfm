<cfset message = "Hello World @ #timeFormat(now())#">
<cfoutput>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#message#</title>
</head>
<body>
<h1>#message#</h1>
<p>#message#</p>
</body>
</html>
</cfoutput>