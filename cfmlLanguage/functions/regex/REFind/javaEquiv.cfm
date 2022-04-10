<cfscript>
	param URL.regex;
	param URL.target;
	param URL.replace;
	param URL.options;

	sRegex		= URL.regex;
	sTarget		= URL.target;
	sReplace	= URL.replace;
	aOptions	= listToArray(URL.options, "");
	
	// prepare options string
	sAllOptions	= "idmsux";
	sOptionsOn	= arrayToList(aOptions, "");
	
	sOptionsOff	= reReplaceNoCase(sAllOptions, "[#sOptionsOn#]", "", "ALL");
	
	sOptionsString = "(?#sOptionsOn#-#sOptionsOff#)";
	
	oPattern	= createObject("java", "java.util.regex.Pattern").compile("#sOptionsString##sRegex#");
	oMatcher	= oPattern.matcher(sTarget);
	
	aMatches = [];
	while(oMatcher.find()){
		stMatch = {
			start		= oMatcher.start(),
			groupCount	= oMatcher.groupCount(),
			end			= oMatcher.end(),
			group		= oMatcher.group()
		};
		aGroups = [];
		for (i=1; i <= stMatch.groupCount; i++){
			stSub = {
				start	= oMatcher.start(javaCast("int", i)),
				end		= oMatcher.end(javaCast("int", i)),
				str		= oMatcher.group(javaCast("int", i))
			};
			arrayAppend(aGroups, stSub);
		}
		stMatch.groups = aGroups;
		arrayAppend(aMatches, stMatch);
	}	
	writeDump(variables);
</cfscript>