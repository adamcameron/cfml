<cfscript>
//listFilter.cfm
numbers = "1,2,3,4";
odds = listFilter(numbers, function(v){
	return v MOD 2;
});	
writeDump([{numbers=numbers},{odds=odds}]);
</cfscript>