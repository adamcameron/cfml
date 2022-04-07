<!---standardRemoteCall.cfm --->
<cfset id = randRange(1,1000)>
<cfhttp method="get" url="http://localhost:8500/shared/CF/rest/encoding/services/Person.cfc?method=getAsXml&id=#id#" result="response">

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>
	<cfoutput>#htmlEditFormat(response.filecontent)#</cfoutput>
</body>
</html>