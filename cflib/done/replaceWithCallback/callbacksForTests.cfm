<cfscript>
// callbacksForTests.cfm
private string function basicCallback(match){
	return replace(match, "match", "replaced");
}

private string function testArgsCallback(match, found, offset, string, matchCount){
	assert(isSimpleValue(match));
	assertEquals("match 1", match);

	assertIsStruct(found);
	assertEquals(
		{len=[7],pos=[1], substring=["match 1"]},
		found
	);

	assert(isNumeric(offset));
	assertEquals(1, offset);

	assert(isSimpleValue(string));
	assertEquals("match 1 match 2", string);

	assert(isNumeric(matchCount));
	assertEquals(1, matchCount);

	return "";
}

private string function testReturnValueCallback(match){
	return "RETURNED FROM CALLBACK";
}
	
</cfscript>