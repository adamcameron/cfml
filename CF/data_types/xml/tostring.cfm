<cfxml variable='myHTMLDOMObject'>
<html>
<head>
	<link href='test' rel='stylesheet' />
</head>
<body>This is the body</body>
</html> 
</cfxml>
<cfdump var='#myHTMLDOMObject#' label='I am a valid XML object'>  
<cfdump var='#toString( myHTMLDOMObject )#' label='Now I am not valid XML 
anymore'>
<cfxml variable='myTestDOMObject'>
<test>
<head>
<link href='test' rel='stylesheet' />
</head>
<body>This is the body</body>
</test>
</cfxml>  
<cfdump var='#myTestDOMObject#' label='I am a valid XML object'>
<cfdump var='#toString( myTestDOMObject )#' label='I stay valid because the html element is not used'>


