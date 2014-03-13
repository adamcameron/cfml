<cfscript>
// callbacksForTests.cfm
private string function basicCallback(match){
	return replace(match, "match", "replaced");
}

private string function testArgsCallback(match, found, offset, string, matchCount){
	expect(match).toBeSimpleValue();
	expect(match).toBe("match 1");

	expect(found).toBeStruct();
	expect(found).toBe({len=[7],pos=[1], substring=["match 1"]});

	expect(offset).toBeNumeric();
	expect(offset).toBe(1);

	expect(string).toBeSimpleValue();
	expect(string).toBe("match 1 match 2");

	expect(matchCount).toBeNumeric();
	expect(matchCount).toBe(1);

	return "";
}

private string function testReturnValueCallback(match){
	return "RETURNED FROM CALLBACK";
}
	
</cfscript>