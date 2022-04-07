component extends="GeneralRegex" {
	

	private array function findHandler(string regex, string target, array options){
		var iStartPos		= 1;
		var sRegex			= arguments.regex;
		var sTarget			= arguments.target;
		var aOptions		= arguments.options;
		var stRegexResult	= {};
		var aSubExprMatches	= [];
		var iSubExpr		= 0;
		var stSubExprMatch	= {};
		var aRegexMatches	= [];
		var sContextOpen	= '<span style="background-color:red;">';
		var sContextClose	= '</span>';
		var cMarker			= chr(26); 	// chr(26) is the SUBstitute char. Should be fairly safe to use.  TODO: check that it's not already in the string

		while (true){ // we break out of this based on internal logic
		
			// do a find, returning all subexpressions
			if (arrayFindNoCase(aOptions, "i")){
				stRegexResult = reFindNoCase(sRegex, sTarget, iStartPos, true);
			}else{
				stRegexResult = reFind(sRegex, sTarget, iStartPos, true);
			}
			// let's see if we've got anything?
			if (stRegexResult.pos[1] && stRegexResult.len[1]){
				// we've got at least one match (the first return is the whole match; the subsequent ones are the subexpressions)
				aSubExprMatches = [];
				// loop over all the subexpressions, extracting their data, substring, and contextualising each subexpression
				for (iSubExpr=1; iSubExpr <= arrayLen(stRegexResult.pos); iSubExpr++){
					stSubExprMatch = {
						pos	= stRegexResult.pos[iSubExpr],
						len = stRegexResult.len[iSubExpr]
					};
					if (stRegexResult.len[iSubExpr]){
						stSubExprMatch.str		= mid(sTarget, stRegexResult.pos[iSubExpr], stRegexResult.len[iSubExpr]);
						stSubExprMatch.context	= getContext(target=sTarget, pos=stRegexResult.pos[iSubExpr], len=stRegexResult.len[iSubExpr]);
					}else{
						stSubExprMatch.str = "";
						stSubExprMatch.context	= "";
					}
					arrayAppend(aSubExprMatches, stSubExprMatch);
				}	// end of looping over subexpressions
				// grab this lot of sub-expressions and append it to the other matches so far
				arrayAppend(aRegexMatches, aSubExprMatches);
				// skip over the match, and continue looking for more
				iStartPos = stRegexResult.pos[1] + stRegexResult.len[1];
			}else{	// no match so exit while() loop
				break;
			}	// end of whether we got a match on this iterarion
			
			// unless we're "global", we only want one match
			if (!arrayFindNoCase(aOptions, "g")){
				break;
			}
		}	// end of finding matches in string
		return aRegexMatches;
	}


	private array function matchHandler(string regex, string target, array options){
		var sRegex			= arguments.regex;
		var sTarget			= arguments.target;
		var aOptions		= arguments.options;
		var aRegexMatches	= [];

		if (arrayFindNoCase(aOptions, "i")){
			aRegexMatches = reMatchNoCase(sRegex, sTarget);
		}else{
			aRegexMatches = reMatch(sRegex, sTarget);
		}
		return aRegexMatches;
	}


	private string function replaceHandler(string regex, string target, string replace, array options){
		var sTarget			= arguments.target;
		var sRegex			= arguments.regex;
		var sReplace		= arguments.replace;
		var aOptions		= arguments.options;
		var sNewString		= "";

		if (arrayFindNoCase(aOptions, "i")){
			sNewString = reReplaceNoCase(sTarget, sRegex, sReplace, arrayFindNoCase(aOptions, "g")?"ALL":"ONE");
		}else{
			sNewString = reReplace(sTarget, sRegex, sReplace, arrayFindNoCase(aOptions, "g")?"ALL":"ONE");
		}
		return sNewString;
	}


}
