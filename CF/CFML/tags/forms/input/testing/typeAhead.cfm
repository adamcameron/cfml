<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
	<title>&lt;input&gt; tests</title>
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
			<td>Autosuggest with typeahead</td>
			<td><cfinput name="txt5" type="text" autosuggest="Adam,Angela,Albert,Andrea,Andrew,Anita,Arthur,Abigail,Alexander,Alexandra" typeahead="true" /></td>
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

