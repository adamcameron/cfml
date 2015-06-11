component {


	remote string function processRequest(string regex, string target, string replaceRegex, string regexMethod, array options){
		/*
			deal with the options.
			i = we use this to decide whether to use the basic function, or the nocase version of it
			m = we prepend (?m) to the beginning of the regex, if it's not there already
			s = TODO: [not supported by CF.  I could work around this, but not for v 1.0]
			x = we prepend (?x) to the beginning of the regex, it it's not already there
			g = used to decide whether to do ONE or ALL in a reReplace() call
			
			deal with m & x first
		*/
		var sRegex			= arguments.regex;
		var sTarget			= arguments.target;
		var sReplace		= arguments.replaceRegex;
		var sMethod			= arguments.RegexMethod;	// one of Find, Match, Replace
		var aOptions		= arguments.options;
		var aRegexMatches	= [];
		var sReturnHtml		= "";
		
		// does it have an m?  if not, stick one on
		if (arrayFindNoCase(aOptions, "m") && !reFindNoCase("\(\?m\)", sRegex)){ // TODO: could technically find one in the middle of the regex.  Might need to deal with this later
			sRegex = "(?m)" & sRegex;
		}
		
		// ditto with an x
		if (arrayFindNoCase(aOptions, "m") && !reFindNoCase("\(\?x\)", sRegex)){ // TODO: could technically find one in the middle of the regex.  Might need to deal with this later
			sRegex = "(?x)" & sRegex;
		}
		// finished monkeying with the regex
		
		try {
			switch (sMethod){
				case "find": {
					aRegexMatches = findHandler(regex=sRegex, target=sTarget, options=aOptions);
					// we've now got the data we need.  render it.  Doing it in an include so I can use CFML.  Pity there is no module() yet
					include "./findRenderer.cfm";	// sets sReturnHtml
					break;
				}
				case "match":{
					aRegexMatches = matchHandler(regex=sRegex, target=sTarget, options=aOptions);
					include "./matchRenderer.cfm";	// sets sReturnHtml
					break;
				}
				case "replace":{
					sNewString = replaceHandler(regex=sRegex, target=sTarget, replace=sReplace, options=aOptions);
					include "./replaceRenderer.cfm";	// sets sReturnHtml
					break;
				}
				default :{
					throw (type="ColdFusionRegex", errorcode="badMethod", message="Invalid method passed to processRequest", detail="The method #sMethod# is not valid.  It must be one of Find, Match, Replace");
				}
			}
		} catch (any e){
			throw (type="ColdFusionRegex", errorcode="badFunctionCall", message="An exception was raised while processing regular expression: #e.message# #e.detail#");
		}
		
		return sReturnHtml;
	}


	private string function getContext(string target, numeric pos, numeric len){
		var sTarget			= arguments.target;
		var iPos			= arguments.pos; 
		var iLen			= arguments.len; 
		var sContextOpen	= '<span style="background-color:red;">';
		var sContextClose	= '</span>';
		var cMarker			= chr(26); 	// chr(26) is the SUBstitute char. Should be fairly safe to use.  TODO: check that it's not already in the string
		var sContext		= insert(cMarker, sTarget, iPos + iLen - 1);

		sContext	= insert(cMarker, sContext, iPos-1);
		sContext	= htmlEditFormat(sContext);
		sContext	= reReplace(sContext, "\x1A(.+)\x1A", '#sContextOpen#\1#sContextClose#', "ONE");
				
		// trim the string a bit
		// if it's longer than 100, and the bit after the match is more than 50, lop everything off after the 50th trailing char
		if (len(sContext) > 100 && len(sContext) - (iPos + iLen + len(sContextOpen & sContextClose)) > 50 ){
			sContext = removeChars(sContext, iPos + iLen + len(sContextOpen & sContextClose) + 50, len(sContext)) & "&hellip;";
		}

		// if it's still over 100 chars long, and the bit before the match is more than 50, then lop the chars off before that
		if (len(sContext) > 100 && iPos > 50){
			sContext = "&hellip;" & removeChars(sContext, 1, iPos - 50);
		}
		return sContext;
	}	


}
