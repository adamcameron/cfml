<cfftp action="open" server="ftp.adobe.com" connection="ftpConnection" username="anonymous" password="anonymous@example.com">
<cfscript>
function f(){
	return arguments;
}

switch (URL.type){
	case "application": {
		o = application;
		break;
	}
	case "arguments": {
		o = f(arg1="value");
		break;
	}
	case "array": {
		o = [];
		break;
	}
	case "date": {
		o = createDate(1,2,3);
		break;
	}
	case "datetime": {
		o = createDateTime(1,2,3,4,5,6);
		break;
	}
	case "exception": {
		try {
			throw;
			} catch (any e){
				o = e;
				
			}
		break;
	}
	case "file": {
		o = fileOpen(getCurrentTemplatePath(), "read");
		break;
	}
	case "float": {
		o = pi();
		break;
	}
	case "ftp": {
		o = ftpConnection;
		break;
	}
	case "integer": {
		o = int(1);
		break;
	}
	case "image": {
		o = imageNew();
		break;
	}
	case "metadata": {
		o = getMetadata(f);
		break;
	}
	case "odbcDate": {
		o = createOdbcDate(createDate(1,2,3));
		break;
	}
	case "odbcDateTime": {
		o = createOdbcDateTime(createDateTime(1,2,3,4,5,6));
		break;
	}
	case "pagecontext": {
		o = getPageContext();
		break;
	}
	case "query":{
		o = queryNew("");
		break;
	}
	case "queryColumn":{
		q = queryNew("col");
		o = q["col"];
		break;
	}
	case "request": {
		o = request;
		break;
	}
	case "server": {
		o = server;
		break;
	}
	case "session": {
		o = session;
		break;
	}
	case "spreadsheet": {
		o = spreadsheetNew();
		break;
	}
	case "string": {
		o = "";
		break;
	}
	case "struct":{
		o = {};
		break;
	}
	case "variables": {
		o = variables;
		break;
	}
	case "xml": {
		o = xmlNew();
		break;
	}
	default :{
		throw(type="InvalidParameterException");
	}
}
title = "#URL.type# (#o.getClass().getName()#)";

switch (CGI.server_port){
	case 8500: {
		baseDir = expandPath("/shared/git/adamcameroncoldfusion.cfmldeveloper.com/wwwroot/undocs/coldfusion/10_0_13/");
		break;
	}
	case 8888: {
		baseDir = expandPath("/shared/git/adamcameroncoldfusion.cfmldeveloper.com/wwwroot/undocs/railo/4_2_0/");
		break;
	}
	case 8090: {
		baseDir = expandPath("/shared/git/adamcameroncoldfusion.cfmldeveloper.com/wwwroot/undocs/openbd/3_1/");
		break;
	}
	default:{
		throw(type="InvalidPlatformException");
	}
}

fileName = baseDir & "#URL.type#.html";
</cfscript>
<cfsavecontent variable="html">
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><cfoutput>#title#</cfoutput></title>
<link rel="stylesheet" type="text/css" href="/lib/css/undocs.css">

</head>
<body>
<cfoutput>
	<h1><cfoutput>#title#</cfoutput></h1>
	<pre>#new ClassViewer().viewObject(o)#</pre>
</cfoutput>
</body>
</html>
</cfsavecontent>
<cffile action="write" file="#fileName#" output="#html#">
<cfoutput>#html#</cfoutput>