<cfscript>
	writeOutput("<h2>String</h2>");

	arrayToSearch = ["value"];

	writeOutput("<h3>String with same case</h3>");
	valueToFind = "value";
	found = arrayFindNoCase(arrayToSearch, valueToFind);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>String with differing case</h3>");
	valueToFind = "VALUE";
	found = arrayFindNoCase(arrayToSearch, valueToFind);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");
</cfscript>