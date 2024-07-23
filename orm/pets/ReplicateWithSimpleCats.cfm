<cfscript>
	// start afresh 
	ormReload();

	// create an owner
	oOwner = new CatOwner();
	oOwner.setOwnerName("Jon Arbuckle");
	oOwner.setCats(["Garfield", "Nermal", "Tigger", "Bagpuss", "Stimpy"]);
	
	entitySave(oOwner);
	ormFlush();

	// get the owner back again
	oOwner = entityLoad("CatOwner", {ownerName="Jon Arbuckle"}, true);
	writeDump(oOwner);
</cfscript>