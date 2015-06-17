<!---standardRemoteCall.cfm --->
<cfscript>
id = randRange(1,1000);
thisUrlPath = CGI.script_name;
thisUrlDir = thisUrlPath.listDeleteAt(thisUrlPath.listLen("/"), "/");
targetUrl = thisUrlDir &  "/services/Person.cfc";
</cfscript>

<cfhttp method="get" url="http://#CGI.http_host##targetUrl#?method=getAsXml&id=#id#" result="response">

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