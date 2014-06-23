<cfscript>
// cf11.cfm
originalArray = ["tahi","rua","toru","wha"];

mappedArray = originalArray.map(function(required string string){
	return ucase(string);
});
writedump(mappedArray);
</cfscript>