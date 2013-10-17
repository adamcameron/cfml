<cfscript>
function isArrayOf(object, validator){
	if (!isArray(object)){
		return false;
	}

	for (var element in object){
		if (!validator(element)){
			return false;
		}
	}
	return true;
}


	function isArrayOfCf5(array, validator){
		var idx		= 0;

		if (NOT isArray(array)){
			return false;
		}

		for (idx=1; idx LE arrayLen(array); idx=idx+1){
			if (NOT validator(array[idx])){
				return false;
			}
		}
		return true;
	}


numbers = [
	{number=1, english="one", maori="tahi"},
	{number=2, english="two", maori="rua"},
	{number=3, english="three", maori="toru"},
	{number=4, english="four", maori={}},
	[]
];

function numbersValdiator(number){
	return structKeyExists(number, "number") && structKeyExists(number, "english") && structKeyExists(number, "maori");
}



function allSimpleValues(struct){
	for (var key in struct){
		if (!isSimpleValue(struct[key])){
			return false;
		}
	}
	return true;
}

function isStructWrapper(struct){
	return isStruct(struct);
}



writeOutput(isArrayOf(numbers, isStructWrapper));


</cfscript>