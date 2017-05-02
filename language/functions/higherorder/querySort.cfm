<cfscript>
numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"]
]);
numbers2 = duplicate(numbers);

reversed = numbers.sort(function(n1,n2){
	return n2.id - n1.id;
});
numbers.id[1] = "CHANGED!";
writeDump([reversed,numbers]);

reversed2 = querySort(numbers2, function(n1,n2){
	return n2.id - n1.id;
});
numbers2.id[1] = "CHANGED!";
writeDump([reversed2,numbers2]);


</cfscript>