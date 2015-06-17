<cfform method="post" action="./form.cfm" name="myForm" id="myForm">
	<!--- <cfinput type="text" name="myInput" id="myInput" value="default" /> --->
	<cfinclude template="./input.cfm">
	<cfinput type="submit" name="mySubmit" id="mySubmit" value="Submit" />
</cfform>