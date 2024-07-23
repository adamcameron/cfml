<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>title</title></head>
	<body>
		<cfwindow	x			= "100"
					y			= "100"
					width		= "300"
					height		= "300"
					name		= "marmoset"
					title		= "My Window"
					closable	= "false"
					draggable	= "false"
					resizable	= "false"
					initshow	= "true"
		>
		My Window's content
		<cfdump var="#URL#">
		</cfwindow>
	</body>
</html>