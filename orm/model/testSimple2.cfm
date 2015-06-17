<cfscript>
	// on the first pass we create a new object
	if (not structKeyExists(URL, "id")) {
		myFirstObj = new Simple();
		myFirstObj.setName("Adam");
		entitySave(myFirstObj);
		myFirstObjId = myFirstObj.getId();
		writeOutput('Object with ID #myFirstObjId# created.  Go to <a href="#CGI.script_name#?id=#myFirstObjId#">next step</a>');
	}else{
		// on the second we LOAD the object with the ID passed through
		mySecondObj = entityLoad("Simple", URL.id, true);
		mySecondObj.setId(URL.id);	// don't need to do this, but keeping it as similar as the other example as possible
		mySecondObj.setName("Belinda");
		entitySave(mySecondObj);	// this time it works fine
	}
</cfscript>