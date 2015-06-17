<cfoutput>
<form method="post" action="#CGI.script_name#">
	Owner: 
	<cfset aOwners = entityLoad("petOwner")>
	<select name="ownerId">
		<cfloop array="#aOwners#" index="oOwner">
			<option value="#oOwner.getOwnerId()#">#oOwner.getOwnerName()#</option>
		</cfloop>
	</select>
	<br />

	Type: 
	<select name="type">
		<option>Bird</option>
		<option>Dog</option>
		<option>Fish</option>
	</select>
	<br />
	Name: <input type="text" name="petName" value="" /><br />
	Wings/legs/fins: <input type="text" name="appendages" value="" /><br />
	<input type="submit" name="btnSubmit" value="Save" />
</form>
</cfoutput>
<cfscript>
	// create this wee beastie
	if (cgi.request_method eq "post"){
		switch (form.type){
			case "Bird": {
				oPet = new Bird();
				oPet.setWings(form.appendages);
				break;
			}
			case "Dog": {
				oPet = new Dog();
				oPet.setLegs(form.appendages);
				break;
			}
			case "Fish": {
				oPet = new Fish();
				oPet.setFins(form.appendages);
				break;
			}
		}
		oPet.setPetName(form.petName);
		oPet.setOwnerId = setOwnerId;
		oPet.setOwnerId(form.ownerId);
		

		// now get the owner's existing pets

		oOwner = entityLoad("petOwner", form.ownerId, true);
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
		<!--- screw the legs/wings/fins --->
	</cfoutput>
	<hr />
</cfloop>
