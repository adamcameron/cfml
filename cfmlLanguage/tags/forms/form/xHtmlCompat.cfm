<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Checking where &lt;cfform&gt; puts its validation JS</title>
	</head>
	<body>
		<cfform format="html" method="post" action="#CGI.script_name#" name="frm" id="frm" >
			Age: <cfinput name="sAge" id="sAge" type="text" validate="integer" validateat="onBlur" message="Whole number of years only" range="0,130" />
			<cfinput name="btnSubmit" id="btnSubmit" type="submit" value="Go &raquo;" />
		</cfform>
	</body>
</html>
