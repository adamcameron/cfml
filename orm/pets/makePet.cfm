<cfoutput>
<form method="post" action="#CGI.script_name#">
	Owner: 
	<cfset aOwners = entityLoad("PetOwner")>
	<select name="ownerId">
		<cfloop array="#aOwners#" index="oOwner">
			<option value="#oOwner.getOwnerId()#">#oOwner.getOwnerName()#</option>
		</cfloop>
	</select>
	<br />

	Name: <input type="text" name="petName" value="" /><br />
	<input type="submit" name="btnSubmit" value="Save" />
</form>
</cfoutput>
<cfscript>
	// create this wee beastie
	if (cgi.request_method eq "post"){

		oPet = new Pet();
		oPet.setPetName(form.petName);
		oPet.setOwnerId = setOwnerId;
		oPet.setOwnerId(form.ownerId);
		

		// now get the owner's existing pets

		oOwner = entityLoad("PetOwner", form.ownerId, true);
		aPets = oOwner.getPets();
		
		// add the new one
		arrayAppend(aPets, oPet);
		oOwner.setPets(aPets);
try {		
		// save the owner
		entitySave(oOwner);
		ormFlush();
} catch(any e){
	writeDump(e);
	writeDump(form);
	writeDump(oPet);
	writeDump(aPets);
	writeDump(oOwner);
}

	}
	
	function setOwnerId(ownerId){
		variables.ownerId = arguments.ownerId;
	}
	
</cfscript>

<!---get all the pets--->
<cfset aPets = entityLoad("Pet")>
<cfloop array="#aPets#" index="oPet">
	<cfoutput>
		Type: #oPet.getType()#<br />
		Name: #oPet.getPetName()#<br />
	</cfoutput>
	<hr />
</cfloop>
