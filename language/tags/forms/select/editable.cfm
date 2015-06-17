<cfform method="post" action="./editable.cfm" format="flash" height="200" width="500">
	<cfselect name="mySelect" editable="true">
		<option>one</option>
		<option>Deux</option>
		<option>San</option>
		<option>Vier</option>
	</cfselect>
	<cfinput type="text" name="txt1" value="" />
</cfform>
<cfif structKeyExists(form, "fieldNames")>
	<cfdump var="#form#">
</cfif>