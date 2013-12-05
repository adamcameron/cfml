<cfscript>
	/**
		@hint Analogous to reReplace()/reReplaceNoCase(), except the replacement is the result of a callback, not a hard-coded string
		@string The string to process
		@regex The regular expression to match
		@callback A UDF which takes arguments match (substring matched), found (a struct of keys pos,len,substring, which is subexpression breakdown of the match), offset (where in the string the match was found), string (the string the match was found within)
		@scope Number of replacements to make: either ONE or ALL
		@caseSensitive Whether the regex is handled case-sensitively
	*/
	string function replaceWithCallback(required string string, required string regex, required any callback, string scope="ONE", boolean caseSensitive=true){
		if (!isCustomFunction(callback)){ // for CF10 we could specify a type of "function", but not in CF9
			throw(type="Application", message="Invalid callback argument value", detail="The callback argument of the replaceWithCallback() function must itself be a function reference.");
		}
		if (!isValid("regex", scope, "(?i)ONE|ALL")){
			throw(type="Application", message="The scope argument of the replaceWithCallback() function has an invalid value #scope#.", detail="Allowed values are ONE, ALL.");
		}
		var startAt	= 1;

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

			var replacement = callback(match, found, offset, string);

			string = removeChars(string, found.pos[1], found.len[1]);
			string = insert(replacement, string, found.pos[1]-1);

			if (scope=="ONE"){
				break;
			}
			startAt = found.pos[1] + len(replacement);
		}
		return string;
	}


	function reverseEm(required string match, required struct found, required numeric offset, required string string){
		return reverse(match);
	}

	input = "abCDefGHij";
	result = replaceWithCallback(input, "[a-z]{2}", reverseEm, "ALL", true);
	writeOutput(input & "<br>" & result & "<br><hr>");

	function oddOrEven(required string match, required struct found, required numeric offset, required string string){
		var oddOrEven = match MOD 2 ? "odd" : "even";
		return match & " (#oddOrEven#)";
	}

	input = "1, 6, 12, 17, 20";
	result = replaceWithCallback(input, "\d+", oddOrEven, "ALL", true);
	writeOutput(input & "<br>" & result & "<br><hr>");


	function messWithUuid(required string match, required struct found, required numeric offset, required string string){
		var firstEight			= reverse(found.substring[2]);
		var nextFour			= lcase(found.substring[3]);
		var secondSetOfFour		= "<strong>" & found.substring[4] & "</strong>";
		var lastBit				= reReplace(found.substring[5], "\d", "x", "all");

		return "#firstEight#-#nextFour#-#secondSetOfFour#-#lastBit#";
	}

	input = "#createUuid()#,XXXXXXXXX-XXXX-XXXX-XXXXXXXXXXXXXXXX,#createUuid()#";
	result = replaceWithCallback(input, "([0-9A-F]{8})-([0-9A-F]{4})-([0-9A-F]{4})-([0-9A-F]{16})", messWithUuid, "ALL", true);
	writeOutput(input & "<br>" & result & "<br><hr>");
</cfscript>