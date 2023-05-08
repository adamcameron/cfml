<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
	<title>&lt;cfinput&gt; general tests</title>
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
			<td>Vanilla</td>
			<td><cfinput name="txt1" /></td>
		</tr>
		<tr>
			<td>Autosuggest from CFC</td>
			<td><cfinput name="txt2" autosuggest="cfc:shared.cf.cfml.I.input.testing.Suggestions.getFullNames({cfautosuggestvalue})" onbinderror="onBindErrorHandler" autosuggestbinddelay="1.5" bindonload="true"  /></td>
		</tr>
		<tr>
			<td>Autosuggest from string</td>
			<td><cfinput name="txt3" autosuggest="Adam/Angela/Albert/Andrea/Andrew/Anita/Arthur/Abigail/Alexander/Alexandra" delimiter="/" /></td>
		</tr>
		<tr>
			<td>Autosuggest with matchcontains</td>
			<td><cfinput name="txt4" autosuggest="Adam,Angela,Albert,Andrea,Andrew,Anita,Arthur,Abigail,Alexander,Alexandra" matchcontains="true" maxresultsdisplayed="4" /></td>
		</tr>
		<tr>
			<td>Autosuggest with typeahead</td>
			<td><cfinput type="text" name="txt5" autosuggest="Adam,Angela,Albert,Andrea,Andrew,Anita,Arthur,Abigail,Alexander,Alexandra" typeahead="true" /></td>
		</tr>
		<tr>
			<td>mask</td>
			<td><cfinput name="txt6" mask="(999)999-9999 (\9)" value="" /></td>
		</tr>
		<tr>
			<td>maxlength (5)</td>
			<td><cfinput name="txt7" maxlength="5" /></td>
		</tr>
		<tr>
			<td>Required</td>
			<td><cfinput name="txt8" required="true" message="Oi!" value="This is required" /></td>
		</tr>
		<tr>
			<td>Tooltip Src</td>
			<td><cfinput name="txt9" sourcefortooltip="./tooltip.cfm" /></td>
		</tr>
		<tr>
			<td>Tooltip text</td>
			<td><cfinput name="txt10" tooltip="Nomink to see here" /></td>
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

