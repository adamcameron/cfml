<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HTML4 compliance</title>
</head>
<body>
<cfform method="post" action="#cgi.script_name#">
	<table>
		<tr>
			<td>&lt;input type="text" /&gt;</td>
			<td><cfinput name="txt1"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right"><cfinput type="submit" name="btn1" id="btn1" value="Submit" /></td>
		</tr>
	</table>
	
</cfform>
</body>
</html>