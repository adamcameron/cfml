<cfscript>
// structFilter.cfm
numbers = {one="tahi",two="rua",three="toru",four="wha"};
fourLetterWords = structFilter(numbers, function(k,v){
	return len(v) == 4;
});	
writeDump([{numbers=numbers},{fourLetterWords=fourLetterWords}]);
</cfscript>