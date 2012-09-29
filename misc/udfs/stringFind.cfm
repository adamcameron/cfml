<cfscript>
	array function stringFind(required string pattern, required string string, boolean all=false, numeric start=1, boolean caseSensitive=false){
		var result	= [];
		var matches	= [];
		var i		= 0;
		var match	= "";
		
		if (caseSensitive){
			finder = function(pattern, string, start){
				return reFindNoCase(pattern, string, start, true);
			};
		}else{
			finder = function(pattern, string, start){
				return reFind(pattern, string, start, true);
			};
		}
		
		do {
			matches = finder(pattern, string, start);
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
				if (!all){
					break;
				}
			}
			start = matches.pos[1] + matches.len[1];
		} while(matches.pos[1]);
		return result;
	}
</cfscript>