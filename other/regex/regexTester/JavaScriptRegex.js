function JavaScriptRegex(){

}

JavaScriptRegex.prototype.processRequest = function(regex, target, replaceRegex, regexMethod, options){
	var aRegexMatches	= new Array();
	var sReturnHtml		= "";
	
	try {
		switch (regexMethod){
			case "Find": {
				aRegexMatches = this.findHandler(regex, target, options);
				// we've now got the data we need.  render it.  Doing it in an include so I can use CFML.  Pity there is no module() yet
				sReturnHtml = this.findRenderer(aRegexMatches);
				break;
			}

			case "Replace":{
				sNewString = this.replaceHandler(regex, target, replaceRegex, options);
				sReturnHtml = this.replaceRenderer(sNewString);
				break;
			}
			default :{
				throw ("Invalid method passed to processRequest. The method " + regexMethod + " is not valid.  It must be one of Find, Match, Replace");
			}
		}
	} catch (e){
		alert(e);
	}
	return sReturnHtml;
}


JavaScriptRegex.prototype.findHandler = function(regex, target, options){
	alert("findHandler");
	
	
}

JavaScriptRegex.prototype.replaceHandler = function(regex, target, replace, options){
	var sOptions	= options.join('');
	var oRegex		= new RegExp(regex, sOptions);
	var sNewString	= target.replace(oRegex, replace);		

	return sNewString;
}


JavaScriptRegex.prototype.getContext = function(target, pos, len){
	var sContextOpen	= '<span style="background-color:red;">';
	var sContextClose	= '</span>';
	var cMarker			= String.fromCharCode(26); 	// chr(26) is the SUBstitute char. Should be fairly safe to use.  TODO: check that it's not already in the string
	var sContext		= sTarget.substr(0, pos + len - 2) + cMarker + sTarget.substr(pos + len - 1);  // stick the trailing SUB char in

	sContext	= insert(cMarker, sContext, iPos-1);
	sContent	= sContext.substr(0, pos - 2) + cMarker + sTarget.substr(pos - 1); // stick the leading SUB char in
	sContext	= this.escapeHTML(sContext);
	sContext	= sContext.replace("\x1A(.+)\x1A", sContextOpen + "$1" + ContextClose);
			
	// trim the string a bit
	// if it's longer than 100, and the bit after the match is more than 50, lop everything off after the 50th trailing char
	if (sContext.length > 100 && sContext.length - (pos + len + sContextOpen.length + sContextClose.length) > 50 ){
		sContext = sContext.substr(pos + len + sContextOpen.length + sContextClose.length + 50) + "&hellip;";
	}

	// if it's still over 100 chars long, and the bit before the match is more than 50, then lop the chars off before that
	if (sContext.length > 100 && pos > 50){
		sContext = "&hellip;" + sContext.substr(pos - 50);
	}
	return sContext;
}


JavaScriptRegex.prototype.findRenderer = function(regexMatches){	// array
	var sReturn		= "";
	var sRowClass	= "";
	var iMatchCount	= 0;
	var iSub		= 0;
	
	if (regexMatches.length){
		sReturn = '<table cellspacing="0" class="results"><thead><tr><th rowspan="2" valign="top">Match</th><th colspan="5">Details</th></tr><tr><th>Subexpr</th><th>Position</th><th>Length</th><th>Substring</th><th>Context</th></tr></thead><tbody>';
		for (var iMatch=0; iMatch < regexMatches.length; iMatch++){
			if (iMatch % 2 == 0){
				sRowClass = "stripe";
			}else{
				sRowClass = "nostripe";
			}
			sReturn += ('<tr class="' + sRowClass + '">');
			
			iMatchCount = regexMatches[iMatch].length;
			sReturn += ('<td rowspan="' + iMatchCount + '">' + iMatch + '</td>');
			
			for (iSub=0; iSub < iMatchCount; iSub++){
				if (iSub > 0){
					sReturn += ('<tr class="' + sRowClass + '">');
				}
				sReturn += '<td>';
				if (iSub == 0){
					sReturn += 'Entire';
				}else{
					sReturn += (iSub-1);
				}
				sReturn += '</td>';

				sReturn += ('<td>' + regexMatches[iMatch][iSub].pos +'&nbsp;</td>');
				sReturn += ('<td>' + regexMatches[iMatch][iSub].len +'&nbsp;</td>');
				
				if (regexMatches[iMatch][iSub].str.length > 0){
					sReturn += ('<td>' + this.escapeHtml(regexMatches[iMatch][iSub].str) + '</td>');
					sReturn += ('<td>' + regexMatches[iMatch][iSub].context + '</td>');
				}else{
					sReturn += ('<td>&nbsp;</td>');
					sReturn += ('<td>&nbsp;</td>');
				}
				sReturn += '</tr>';
			}
		}
		sReturn += '</tbody></table>';
	}else{
		sReturn = "No matches found";
	}
	
	return sReturn;
}


JavaScriptRegex.prototype.replaceRenderer = function(newString){
	var sReturn = "";
	if (newString.length){
		sReturn = '<table cellspacing="0" class="results"><thead><tr><th>Updated String</th></tr></thead><tbody><tr><td>';
		sReturn += this.escapeHtml(sNewString);
		sReturn += '</td></tr></tbody></table>';
	}else{
		sReturn = "No string returned";
	}
	return sReturn;
}

JavaScriptRegex.prototype.escapeHtml = function(str){
	str = str.replace(/</g, "&lt;");
	str = str.replace(/>/g, "&gt;");
	str = str.replace(/&/g, "&amp;");
	str = str.replace(/"/g, "&quot;");
	return str;
}
