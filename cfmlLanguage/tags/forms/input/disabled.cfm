<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Checking Disabled</title>
	</head>
	<body>
		<cfform format="html" method="post" action="#CGI.script_name#" name="frm" id="frm">
			Disabled: <cfinput name="sFirst" id="sFirst" type="text" disabled="" />
			<input name="btnSubmit" id="btnSubmit" type="submit" value="Go &raquo;" />
		</cfform>
		<cfdump var="#form#">
	</body>
</html>
