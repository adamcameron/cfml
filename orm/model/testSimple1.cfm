<cfscript>
	// on the first pass we create a new object
	if (not structKeyExists(URL, "id")) {
		myFirstObj = new Simple();
		myFirstObj.setName("Adam");
		entitySave(myFirstObj);
		myFirstObjId = myFirstObj.getId();
		writeOutput('Object with ID #myFirstObjId# created.  Go to <a href="#CGI.script_name#?id=#myFirstObjId#">next step</a>');
	}else{	// we're doing this as two requests to get around the "you can't have two objects with the same ID" error one gets if one tries to do this in a single request
		// on the second we create a new object with the same ID as the one we created on the first pass
		mySecondObj = new Simple();
		mySecondObj.setId(URL.id);	// same ID as was created in preceding request
		mySecondObj.setName("Belinda");
		entitySave(mySecondObj);	// this gives your error
	}
</cfscript>