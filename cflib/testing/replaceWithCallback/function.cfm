<cfscript>
string function replaceWithCallback(required string string, required string regex, required any callback, string scope="ONE", boolean caseSensitive=true){
	if (!isCustomFunction(callback)){ // for CF10 we could specify a type of "function", but not in CF9
		throw(type="Application", message="Invalid callback argument value", detail="The callback argument of the replaceWithCallback() function must itself be a function reference.");
	}
	if (!isValid("regex", scope, "(?i)ONE|ALL")){
		throw(type="Application", message="The scope argument of the replaceWithCallback() function has an invalid value #scope#.", detail="Allowed values are ONE, ALL.");
	}
	var startAt		= 1;
	var matchCount	= 0;

	while (true){	// there's multiple exit conditions in multiple places in the loop, so deal with exit conditions when appropriate rather than here
		if (caseSensitive){
			var found = reFind(regex, string, startAt, true);
		}else{
			var found = reFindNoCase(regex, string, startAt, true);
		}
		if (!found.pos[1]){ // ie: it didn't find anything
			break;
		}
		found.substring=[];	// as well as the usual pos and len that CF gives us, we're gonna pass the actual substrings too
		for (var i=1; i <= arrayLen(found.pos); i++){
			found.substring[i] = mid(string, found.pos[i], found.len[i]);
		}
		var match = mid(string, found.pos[1], found.len[1]);
		var offset = found.pos[1];

		var replacement = callback(match, found, offset, string, ++matchCount);

		string = removeChars(string, found.pos[1], found.len[1]);
		string = insert(replacement, string, found.pos[1]-1);

		if (scope=="ONE"){
			break;
		}
		startAt = found.pos[1] + len(replacement);
	}
	return string;
}
</cfscript>