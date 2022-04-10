<cfform method="post" action="#CGI.script_name#" format="html">
	<cfinput type="text" name="txt1" required="true" />
	<input type="submit" name="btnSubmit" value="submit" />
</cfform>
<cfdump var="#form#">