<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>

</head>

<body>
<!--- <cfform action="." method="post">
	<cfinput name="testIt" type="text" maxlength="10" required="no" validate="regular_expression" pattern="^[a-zA-Z0-9]{5,10}$" message="Must be alphanumeric and 5-10 chars">
	<input name="submitButton" type="submit" value="Go &raquo;" />
</cfform> --->

<cfoutput>
[#REFind("[[:word:]]", "_")#]
</cfoutput>

</body>
</html>
