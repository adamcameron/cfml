<cfscript>
// listSort.cfm

numbers = "4:wha,2:rua,1:tahi,3:toru";
numbers = listSort(numbers, function(v1,v2){
	return sgn(listFirst(v1, ":") - listFirst(v2, ":"));
});
writeDump(var=numbers);

</cfscript>