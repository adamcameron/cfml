<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
	<title>&lt;cfform&gt; tests</title>
</head>
<body>
<cfform method="post" action="#cgi.script_name#" format="html">
	<table>
		<tr>
			<td>&lt;input type="text" /&gt;</td>
			<td><cfinput name="txt1" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><cfinput type="submit" name="btn1" id="btn1" value="Submit" /></td>
		</tr>
	</table>
	
</cfform>

<cfif CGI.request_method eq "POST">
	<cfdump var="#form#">
</cfif>

</body>
</html>

