<cfscript>
// arrayFilter.cfm
numbers = [1,2,3,4];
odds = arrayFilter(numbers, function(v){
	writeDump(arguments);
	return v MOD 2;
});	
writeDump([{numbers=numbers},{odds=odds}]);
</cfscript>