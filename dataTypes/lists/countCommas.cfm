<cfscript>
	s = "1,2,3,4,5,,,,,,10";
	writeOutput("Using listLen(): [#listLen(s)-1#]<br />");
	
	i = len(REReplace(s, "[^,]*", "", "all"));
	
	writeOutput("Using regex: [#i#]<br />");
</cfscript>