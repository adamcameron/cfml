<cfscript>
list = ",2,,4,,,7,,,,";
lengthNoEmpties = listLen(list);
lengthWithEmpties = listLen(list,",",true);

writeDump([list,lengthNoEmpties,lengthWithEmpties]);

writeOutput("<br>listFilter() with empties: ");
filtered = listFilter(list, function(v){
	if (isNumeric(v)){
		return v mod 2; // ie: odd numbers
	}
	return true;
}, ",", true);
writeDump([filtered]);
</cfscript>