<cfoutput><form method="post" action="#CGI.script_name#"></cfoutput>
	Name: <input type="text" name="ownerName" value="" /><br />
	<input type="submit" name="btnSubmit" value="Save" />
</form>
<cfscript>
	// add this wee beastie
	if (cgi.request_method eq "post"){
		oOwner = new petOwner();
		oOwner.setOwnerName(form.ownerName);
		entitySave(oOwner);
		ormFlush();
	}
</cfscript>

<!---get all the pets--->
<cfset aOwners = entityLoad("petOwner")>
<cfloop array="#aOwners#" index="oOwner">
	<cfoutput>
		Name: #oOwner.getOwnerName()#<br />
	</cfoutput>
	<hr />
</cfloop>
