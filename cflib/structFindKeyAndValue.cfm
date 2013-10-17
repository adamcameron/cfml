<cfscript>
public array function structFindKeyWithValue(required struct struct, required string key, required string value, string scope="ONE"){
	if (!isValid("regex", arguments.scope, "(?i)one|all")){
		throw(type="InvalidArgumentException", message="Search scope #arguments.scope# must be ""one"" or ""all"".");
	}
	var keyResult = structFindKey(struct, key, scope);
	var valueResult = [];
	for (var i=1; i <= arrayLen(keyResult); i++){
		if (keyResult[i].value == value){
			arrayAppend(valueResult, keyResult[i]);
		}
	}
	return valueResult;
}

numbers = {
	one		= "tahi",
	two		= [
		{rua="two"},
		{rua="deux"}
	],
	three	= [
		{toru="three"},
		{toru="trois"},
		{toru="drei"}
	],
	wha = "four",
	duplicates = [
		{rua="two"},
		{toru="trois"}
	]
};

result = structFindKeyWithValue(
	numbers,
	"rua",
	"two",
	"ALL"
);

writeDump(result);
</cfscript>