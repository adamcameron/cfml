<cfscript>
	writeOutput("<h2>Objects</h2>");

	arrayToSearch = [createTestObject({name="property", value="value"})];

	writeOutput("<h3>Object with property name/value with same case</h3>");
	valueToFind = createTestObject({name="property", value="value"});
	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>Object with property value with differing case</h3>");
	valueToFind = createTestObject({name="property", value="VALUE"});

	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>Object with property name with differing case</h3>");
	valueToFind = createTestObject({name="PROPERTY", value="value"});

	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");


	function createTestObject(struct property){
		var o = new Object();
		o[property.name] = property.value;
		return o;
	}
</cfscript>