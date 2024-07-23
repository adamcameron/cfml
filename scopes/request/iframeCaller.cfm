<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>Page Title</title>
	</head>
	<body>
		<cfscript>
				a="aaaaaaaaaaa";
				b="bbbbbbbbbbb";

				request.r1="rrrrrrr111111111";
				request.r2="rrrrrrrr222222222";

				session.s1="sssssssssss11111111111";
				session.s2="sssssssssss2222222222";
		</cfscript>
		<iframe src="./iframeContent.cfm" width="600" height="400" name="myframe" scrolling="yes">
		</iframe><br />
		variables
		<cfdump var="#variables#">
		request
		<cfdump var="#request#">
		session
		<cfdump var="#session#">
	</body>
</html>
	