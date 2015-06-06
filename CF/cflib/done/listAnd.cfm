<cfscript>
string function listAnd(required string list1, required string list2, string delimiter=",", boolean caseSensitive=false){
	// exit early if poss
	
	// are the lists the same (given casing requirements)
	if (
		(caseSensitive && !compare(list1,list2))
		||
		(!caseSensitive && !compareNoCase(list1,list2))
	){
		return list1;
	}

	// if either is empty, the AND of them will be empty
	if (list1 == "" || list2 == ""){
		return "";	
	}

	list2 = delimiter & list2 & delimiter;	// just makes it easier to do the find operation if all elements are wrapped in delimiters
	if (!caseSensitive){
		list2 = ucase(list2);
	}

	var result = {};
	for (var element in listToArray(list1, delimiter)){
		var item = delimiter & element & delimiter;
		if (!caseSensitive){
			item = ucase(item);
		}
		if (find(item, list2)){
			result[element] = "";
		}
	}
	return structKeyList(result, delimiter);
}
		
writeOutput("<h3>equal lists: case insensitive</h3>");
list1 = "one,two,three,four";
list2 = "ONE,TWO,THREE,FOUR";
listsAnded = listAnd(list1, list2, ",", false);
writeDump(var=variables, showudfs=false);
writeOutput("<hr>");
		
writeOutput("<h3>equal lists: case sensitive</h3>");
list1 = "one,two,three,four";
list2 = "one,two,three,four";
listsAnded = listAnd(list1, list2, ",", true);
writeDump(var=variables, showudfs=false);
writeOutput("<hr>");
		
writeOutput("<h3>equal lists case differs: case sensitive</h3>");
list1 = "one,two,three,four";
list2 = "ONE,TWO,THREE,FOUR";
listsAnded = listAnd(list1, list2, ",", true);
writeDump(var=variables, showudfs=false);
writeOutput("<hr>");
		
writeOutput("<h3>equal lists case differs: case insensitive</h3>");
list1 = "one,two,three,four";
list2 = "ONE,TWO,THREE,FOUR";
listsAnded = listAnd(list1, list2, ",", false);
writeDump(var=variables, showudfs=false);
writeOutput("<hr>");
		
writeOutput("<h3>delimiter</h3>");
list1 = "one|two|three|four";
list2 = "ONE|TWO";
listsAnded = listAnd(list1, list2, "|", false);
writeDump(var=variables, showudfs=false);
writeOutput("<hr>");
</cfscript>