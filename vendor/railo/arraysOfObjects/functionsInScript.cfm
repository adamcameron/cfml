<cfscript>
// functionsToTest.cfm
private any function acceptArrayOfSamples(required Sample[] samples){
	return samples;
}

private Sample[] function returnArrayOfSamples(required array samples){
	return samples;
}

private any function acceptArrayOfStrings(required string[] strings){
	return strings;
}

private string[] function returnArrayOfStrings(required array strings){
	return strings;
}

private any function acceptArrayOfNumerics(required numeric[] numerics){
	return numerics;
}

private numeric[] function returnArrayOfNumerics(required array numerics){
	return numerics;
}

private any function acceptArrayOfStructs(required struct[] structs){
	return structs;
}

private struct[] function returnArrayOfStructs(required array structs){
	return structs;
}
</cfscript>