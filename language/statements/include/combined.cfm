<!--- combined.cfm--->
<cfprocessingdirective pageEncoding="utf-8">
<cfscript>
title = "G'day World!";
message = "Kia ora, ao!";
alert = "Tēnā koutou";
</cfscript>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#title#</title>
	<script>
	alert("#alert#");
	</script>
</head>
<body>
	<p>#message#
</body>
</html>
</cfoutput>