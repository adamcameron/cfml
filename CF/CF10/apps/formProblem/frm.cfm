<cfapplication name="testApplication" />

<cfdump var="#getApplicationMetaData()#" />
<cfdump var="#form#" />

<cfoutput>
	<form method="post">
		<input name="formField" />
		<input name="formField" />
		<input type="submit" />
	</form>
	$foo
</cfoutput>