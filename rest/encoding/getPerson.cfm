<!---getPerson.cfm --->
<cfset id = randRange(1,1000)>
<cfhttp method="get" url="http://localhost:8500/rest/services/person/#id#" result="xmlResponse" charset="UTF-8">
	<cfhttpparam type="header" name="accept" value="text/xml">
</cfhttp>
<cfhttp method="get" url="http://localhost:8500/rest/services/person/#id#" result="jsonResponse" charset="UTF-8">
	<cfhttpparam type="header" name="accept" value="application/json">
</cfhttp>


<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>
	<cfoutput>
	<h2>XML</h2>
	Raw: #xmlResponse.filecontent#<br />
	Escaped: #htmlEditFormat(xmlResponse.filecontent)#<br />
	Parsed:
	<cfdump var="#xmlParse(xmlResponse.filecontent)#">
	
	<h2>JSON</h2>
	Raw: #jsonResponse.filecontent#<br />
	Deserialised:
	<cfdump var="#deserializeJson(jsonResponse.filecontent)#"> 
	</cfoutput>
</body>
</html>