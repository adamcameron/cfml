<cfscript>
	array function stringFind(required string pattern, required string string, boolean all=false, numeric start=1, boolean caseSensitive=false){
		var result	= [];
		var matches	= [];
		var i		= 0;
		var match	= "";

		do {
			if (caseSensitive){
				matches = reFind(pattern, string, start, true);
			}else{
				matches = reFindNoCase(pattern, string, start, true);
			}
			// if we have a match, we need to extract the matched strings too
			if (matches.pos[1]){
				matches.string = [];
				for (i=1; i <= arrayLen(matches.pos); i++){
					if (matches.len[i]){
						match = mid(string, matches.pos[i], matches.len[i]);
					}else{
						match = "";
					}
					arrayAppend(matches.string, match);
				}
				arrayAppend(result, matches);
				// if we were only after one match: we're done...
				if (!all){
					break;
				}
				// ... otherwise shimmy along to after this match, ready to look for the next one
				start = matches.pos[1] + matches.len[1];
			}
		} while(matches.pos[1]);
		return result;
	}
</cfscript>