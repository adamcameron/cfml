<cfoutput>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>#event.getValue(name="title", defaultValue="", private=true)#</title>
		#renderView("general/styles")#
		#renderView("general/scripts")#
	</head>
	<body>
		#renderLayout(layout="titleBody")#
	</body>
</html>
</cfoutput>