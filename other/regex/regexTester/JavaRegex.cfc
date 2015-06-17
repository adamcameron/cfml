component extends="GeneralRegex" {


	private array function findHandler(string regex, string target, array options){
		var sRegex			= arguments.regex;
		var sTarget			= arguments.target;
		var aOptions		= arguments.options;
		var sOptions		= arrayToList(arguments.options, "");	// list with no delim
		var sAllOptions		= "idmsux";
		var sOptionsOn		= "";
		var sOptionsOff		= "";
		var sOptionsString	= "";
		var oPattern		= false;
		var oMatcher		= false;
		var aRegexMatches	= [];
		var aSubExprMatches	= [];
		var iGroupCount		= 0;
		var iGroup			= 0;
		var stSubExprMatch	= {};
		var sContextOpen	= '<span style="background-color:red;">';
		var sContextClose	= '</span>';
		var cMarker			= chr(26); 	// chr(26) is the SUBstitute char. Should be fairly safe to use.  TODO: check that it's not already in the string

		// sort out the options for the regex
		if (len(sOptions)){
			sOptionsOn	= reReplaceNoCase(sAllOptions, "[^#sOptions#]", "", "ALL");	// the options that are on are any from the "all" list that appear in the list of the passed-in ones.
			sOptionsOff		= reReplaceNoCase(sAllOptions, "[#sOptions#]", "", "ALL");	// the options that are off are any from the "all" list that don't appear in the list of the passed-in ones
		}else{
			sOptionsOn	= "";
			sOptionsOff	= sAllOptions;
		}
		
		sOptionsString	= "(?#sOptionsOn#-#sOptionsOff#)";
		oPattern		= createObject("java", "java.util.regex.Pattern").compile("#sOptionsString##sRegex#");
		oMatcher		= oPattern.matcher(sTarget);
		

		while(oMatcher.find()){
			aSubExprMatches = [];
			// first the full result
			stSubExprMatch = {
				pos		= oMatcher.start() + 1,	// zero-indexed
				len		= oMatcher.end() - oMatcher.start(),
				str		= oMatcher.group()
			};
			stSubExprMatch.context	= getContext(target=sTarget, pos=stSubExprMatch.pos, len=stSubExprMatch.len);
			
			// that's the first whole match done, store it
			arrayAppend(aSubExprMatches, stSubExprMatch);
			
			// now go over all the groups too
			iGroupCount = oMatcher.groupCount();
			for (iGroup=1; iGroup <= iGroupCount; iGroup++){
				stSubExprMatch = {
					pos		= oMatcher.start(iGroup) + 1,	// zero-indexed
					len		= oMatcher.end(iGroup) - oMatcher.start(iGroup),
					str		= oMatcher.group(iGroup)
				};
				if (len(stSubExprMatch.str)){
					stSubExprMatch.context	= getContext(target=sTarget, pos=stSubExprMatch.pos, len=stSubExprMatch.len);
				}else{
					stSubExprMatch.context	= "";
				}
				// that's it.  Save it
				arrayAppend(aSubExprMatches, stSubExprMatch);
			}
			
			// finished with this match: save it.
			arrayAppend(aRegexMatches, aSubExprMatches);

			// unless we're "global", we only want one match
			if (!arrayFindNoCase(aOptions, "g")){
				break;
			}
		}	// end of finding matches in string
		return aRegexMatches;
	}


	private string function replaceHandler(string regex, string target, string replace, array options){
		var sTarget			= arguments.target;
		var sRegex			= arguments.regex;
		var sReplace		= arguments.replace;
		var aOptions		= arguments.options;
		var sOptions		= arrayToList(arguments.options, "");	// list with no delim
		var sAllOptions		= "idmsux";
		var sOptionsOn		= "";
		var sOptionsOff		= "";
		var sOptionsString	= "";
		var oPattern		= false;
		var oMatcher		= false;
		var sNewString		= "";

		// sort out the options for the regex
		if (len(sOptions)){
			sOptionsOn	= reReplaceNoCase(sAllOptions, "[^#sOptions#]", "", "ALL");	// the options that are on are any from the "all" list that appear in the list of the passed-in ones.
			sOptionsOff		= reReplaceNoCase(sAllOptions, "[#sOptions#]", "", "ALL");	// the options that are off are any from the "all" list that don't appear in the list of the passed-in ones
		}else{
			sOptionsOn	= "";
			sOptionsOff	= sAllOptions;
		}
		
		sOptionsString	= "(?#sOptionsOn#-#sOptionsOff#)";
		oPattern		= createObject("java", "java.util.regex.Pattern").compile("#sOptionsString##sRegex#");
		oMatcher		= oPattern.matcher(sTarget);
		
		if (arrayFindNoCase(aOptions, "g")){
			sNewString = oMatcher.replaceAll(sReplace);
		}else{
			sNewString = oMatcher.replaceFirst(sReplace);
		}
		return sNewString;
	}


}
