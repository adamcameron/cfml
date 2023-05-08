<cfscript>
	// start afresh 
	ormReload();

	// create an owner
	oOwner = new CatOwner();
	oOwner.setOwnerName("Jon Arbuckle");
	entitySave(oOwner);
	ormFlush();
	
	// create a cat
	oCat = new Cat();
	oCat.setCatName("Garfield");

	// apply cat to owner
	
	// get the owner back again
	oOwner = entityLoad("CatOwner", {ownerName="Jon Arbuckle"}, true);

	// give the cat to the owner
	aCats = arrayNew(1);	// am guessing at this, because I have set the collection to be an array..?
	arrayAppend(aCats, oCat);
	oOwner.setCats(aCats);	// THIS LINE ERRORS
	
	// save the owner
	entitySave(oOwner);
	ormFlush();
	
	// get the owner back again
	oOwner = entityLoad("CatOwner", {ownerName="Jon Arbuckle"}, true);
	writeDump(oOwner);
</cfscript>