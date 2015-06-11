<cfset sRegex="(<a[^>]*?href=([""'])[^\1]*?\1[^>]*?>">
<cfset sData = '
<html>
	<head><title>Title</title></head>
	<body>
		text<a href="./link1.htm" title="title text"><div id="myLink"></div></a>text text
		text<a href="./link2.htm" title="title text"><div id="myLink"></div></a>text text
	</body>
</html>
'>
<cfset aResult = reMatchNoCase(sRegex,sData)>
<cfdump var="#aResult#">

