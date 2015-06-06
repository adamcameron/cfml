<cfparam name="URL.multipart" default="false">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head><title>Test Std Form</title></head>
	<body>
	<form method="post" action="./frm1.cfm"<cfif URL.multipart> enctype="multipart/form-data"</cfif>>
		<p><input type="checkbox" name="activity" value="Swimming" /></p>
		<p><input type="checkbox" name="activity" value="Golf" /></p>
		<p><input type="checkbox" name="activity" value="Tennis" /></p>
		<p><input type="text" name="firstname" /></p>
		<p><input type="submit" name="btnSubmit" value="Go &raquo;" /></p>
	</form>
	<cfdump var="#form#">
	</body>
</html>