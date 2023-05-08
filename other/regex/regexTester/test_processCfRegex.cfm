<cfset o = createObject("component", "Regex")>
<cfset s = o.processCfRegex(
	regex	= "th((is)|(at))",
	target	= "this is test target string for the regex that finds all the words starting with 'th', but rather ignores other instances of 'TH'.",
	method	= "find",
	options= []
)>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="./regex.css" />
	<title>Regular Expression Tester test Rig</title>
</head>
<body>
<cfoutput>#s#</cfoutput>
</body>
</html>