<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
	<title>&lt;cfinput&gt; validation tests</title>
	<style type="text/css">
		td {
			font-family: Verdana;
		}
	</style>
	<script type="text/javascript">
		function onBindErrorHandler(code, message){
			alert("Code: " + code + "; Message:" + message);
			return false;
		}
	</script>
</head>
<body>
<cfform method="post" action="#cgi.script_name#" format="html">
	<table>
		<tr>
			<td>Validate (1-5)</td>
			<td><cfinput name="txt1" value="" validate="range" range="1,5" validateat="onBlur,onSubmit,onserver" message="Validation failed"  /></td>
		</tr>
		<tr>
			<td>Validate (f-j)</td>
			<td><cfinput name="txt12" value="" validate="regex" pattern="[f-j]" validateat="onBlur,onSubmit,onserver" message="Validation failed"  /></td>
		</tr>
		<tr>
			<td>Validate (1-5,f-j) (not valid)</td>
			<td><cfinput name="txt13" value="" validate="range,regex" range="1,5" pattern="[f-j]" validateat="onBlur,onSubmit,onserver" message="Validation failed"  /></td>
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

