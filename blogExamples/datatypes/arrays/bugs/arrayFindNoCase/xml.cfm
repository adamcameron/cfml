<cfscript>
	writeOutput("<h2>XML</h2>");

	arrayToSearch = [createTestXml(element="aaa", attribute="bbb", value="ccc", text="ddd")];

	writeOutput("<h3>XML with element/attribute/value with same case</h3>");
	valueToFind = createTestXml(element="aaa", attribute="bbb", value="ccc", text="ddd");
	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>XML with element with different case</h3>");
	valueToFind = createTestXml(element="AAA", attribute="bbb", value="ccc", text="ddd");

	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>XML with attribute with different case</h3>");
	valueToFind = createTestXml(element="aaa", attribute="BBB", value="ccc", text="ddd");

	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>XML with attribute value with different case</h3>");
	valueToFind = createTestXml(element="aaa", attribute="bbb", value="CCC", text="ddd");

	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

	writeOutput("<h3>XML with text with different case</h3>");
	valueToFind = createTestXml(element="aaa", attribute="bbb", value="ccc", text="DDD");

	found = arrayFindFunction(arrayToSearch, valueToFind, URL.caseSensitive);
	writeDump(var=[
		arrayToSearch,
		valueToFind,
		found
	], expand=false);
	assert(found, "Not found");
	writeOutput("<hr>");

</cfscript>
<cffunction name="createTestXml">
	<cfset var x = "">
	<cfxml variable="x">
		<cfoutput><#element# #attribute#="#value#">#text#</#element#></cfoutput>
	</cfxml>
	<cfreturn x>
</cffunction>