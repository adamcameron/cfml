<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>title</title></head>
	<body>
	<form method="post" action="./formSubmit.cfm" name="frm1" id="frm1">
		<input type="text" name="text1" value="" />
		<input type="submit" name="btnSubmit" value="submit" />
	</form>
	<cfdump var="#form#">
	</body>
</html>