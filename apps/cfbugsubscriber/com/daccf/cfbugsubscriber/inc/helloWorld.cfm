<!--- /com/daccf/cfbugsubscriber/inc/helloWorld.cfm --->
<cfset message = "Hello World @ #timeFormat(now())# from #getCurrentTemplatePath()#">
<cfoutput>
<html>
<head>
	<title>#message#</title>
</head>
<body>
	<h1>#message#</h1>
	<p>#message#</p>
</body>
</html>
</cfoutput>