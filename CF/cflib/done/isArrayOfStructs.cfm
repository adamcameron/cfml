<cfscript>
function isArrayOfStructs(object){
	if (!isArray(object)){
		return false;
	}
	for (var element in object){
		if (!isStruct(element)){
			return false;
		}
	}
	return true;
}


numbers = [
    {number=1, english="one", maori="tahi"},
    {number=2, english="two", maori="rua"},
    {number=3, english="three", maori="toru"},
    {number=4, english="four", maori="wha"}
];

writeOutput(isArrayOfStructs(numbers));


</cfscript>
