<cfparam name="form.taForm" default="">
<html>
	<head><title>htmlEditFormat() Test</title></head>
	<body>
	
		<form action="./htmlEditFormat.cfm" method="post" id="frmContext" name="frmContent">
			<p>Use the &lt;textarea&gt; below to upload your form<p>
			<textarea name="taForm" id="taForm" cols="80" rows="20"><cfoutput>#htmlEditFormat(form.taForm)#</cfoutput></textarea><br /><br />
			<input type="submit" name="btnSubmit" id="btnSubmit" value="Upload &raquo;" />
		</form>
		<cfif cgi.request_method eq "post">
		<hr />
		<p>
			Here is the form you uploaded:
			<cfoutput>#form.taForm#</cfoutput>
		</p>
		<hr />
		<cfdump var="#form#" label="Raw subbmission">
		</cfif>
	</body>
</html>