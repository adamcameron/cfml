<form method="post">
	<input type="checkbox" value="foo" /><br />
	<input type="submit" name="btnSubmit" value="Submit" /><br />
</form>

<cfif CGI.REQUEST_METHOD eq "POST">
	<cfdump var="#form#">

	<cfset variables.form.foo = "bar">
	<cfoutput>
		isDefined("form.foo"): [#isDefined("form.foo")#]<br />
		structKeyExists(form, "foo"): [#structKeyExists(form, "foo")#]<br />
	</cfoutput>
</cfif>