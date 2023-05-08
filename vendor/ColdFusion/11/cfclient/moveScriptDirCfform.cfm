<cfajaximport scriptsrc="/lib/js/CF/scripts">
<cfform method="post" action="#CGI.script_name#">
	<cfinput type="dateField" name="date">
	<input type="submit" name="submitButton" value="Go">
</cfform>
<cfdump var="#form#">