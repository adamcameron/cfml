<cfscript>
	// create an owner
	oOwner = new PetOwner();
	oOwner.setOwnerName("Charlie Brown");
	entitySave(oOwner);
	ormFlush();
	
	// create a pet
	oPet = new Pet();
	oPet.setPetName("Snoopy");

	// apply pet to owner
	
	// get the owner back again
	oOwner = entityLoad("PetOwner", {ownerName="Charlie Brown"}, true);
	
	// get all pets
	aPets = arrayNew(1);
	arrayAppend(aPets, oPet);
	
	// give them to the owner
	oOwner.setPets(aPets);
	
	// save the owner
	entitySave(oOwner);
	ormFlush();
	
	
	// get the owner back again
	oOwner = entityLoad("PetOwner", {ownerName="Charlie Brown"}, true);
	writeDump(oOwner);	
	
	
</cfscript>