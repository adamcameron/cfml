<cfparam name="form.number" default="1">
<cfparam name="form.txtTest" default="">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>title</title></head>
	<body>
		<cfoutput>
		<form method="post">
			<select name="number" onchange="this.form.submit()">
				<option value="1"<cfif form.number eq 1> selected="selected"</cfif>>One</option>
				<option value="2"<cfif form.number eq 2> selected="selected"</cfif>>Two</option>
				<option value="3"<cfif form.number eq 3> selected="selected"</cfif>>Three</option>
			</select>
			<br />
			<input type="text" name="txtTest" value="#form.txtTest#" />
			<br />
			<input type="submit" name="btnSubmit" value="Go &raquo;" />
		</form>
		</cfoutput>
	<cfif structKeyExists(form, "fieldnames")>
		<cfdump var="#form#">
	</cfif>
	</body>
</html>