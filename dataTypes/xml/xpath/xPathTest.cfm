<html>
	<head>
	<title>XML Tester</title>
	<style type="text/css">
		body, td {
			font-size		: x-small;
			font-family		: verdana, arial, sans-serif;
		}
		td {
			vertical-align	: top;
		}

		textarea {
			width			: 40em;
			height			: 10em;
		}
	</style>
</head>
<body>
<cfparam name="form.frmXml" default="">
<cfparam name="form.frmXpath" default="">
<cfoutput>
<form method="post" action="./xPathTest.cfm">
	<table>
		<tr>
			<td>XML:</td>
			<td><textarea name="frmXml">#form.frmXml#</textarea></td>
		</tr>
		<tr>
			<td>xPath:</td>
			<td><textarea name="frmXpath">#form.frmXpath#</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="btnSubmit" value="Go &raquo;"></td>
		</tr>
	</table>
</form>
</cfoutput>
<cfif cgi.request_method eq "post" and structKeyExists(form, "btnSubmit")>
	<cftry>
		<cfset a = xmlSearch(form.frmXml, form.frmXpath)>
		<cfdump var="#a#">
		<cfcatch>
			An error occurred: <cfoutput>#cfcatch.message#</cfoutput><br />
		</cfcatch>
	</cftry>


</cfif>
</body>
</html>