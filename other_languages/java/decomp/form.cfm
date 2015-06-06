<form method="post" action="./action.cfm">
	<cfloop index="i" from="1" to="10">
		<input type="text" name="txtData" value="" /><br />
	</cfloop>
	<br />
	<input type="radio" name="mode" value="cfloop" /> CFLOOP<br />
	<input type="radio" name="mode" value="cfscript" /> CFSCRIPT<br />
	<br />
	<input type="submit" name="btnSubmit" value="Submit" />
</form>