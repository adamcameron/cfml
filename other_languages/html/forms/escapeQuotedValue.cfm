<cfparam name="form.inp1" default="">

<cfoutput>
<form method="post" action="#CGI.script_name#">
	<input type="text" name="inp1" value="#htmlEditFormat(form.inp1)#" />
	<input type="submit" name="btnSubmit" value="Go &raquo;" />
</form>
</cfoutput>

<cfdump var="#form#">
