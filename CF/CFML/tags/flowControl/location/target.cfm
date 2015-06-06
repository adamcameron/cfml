<html>
	<head><title>Will See This</title></head>
	<body>
		<h1>And This</h1>
		<p>And this too</p>
		<cfset sFileName = "#expandPath('./')#AfterCflocation.dat">
		<cfif fileExists(sFileName)>
			<cffile action="read" file="#sFileName#" variable="sData">
			<cfoutput><p>#sData#</p></cfoutput>
		<cfelse>
		<p>File Not Found</p>
		</cfif>
	</body>
</html>