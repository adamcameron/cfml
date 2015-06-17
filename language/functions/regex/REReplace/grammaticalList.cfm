<cfscript>
	s = "CATEGORY,GROUP,FILE,VERSION,TYPE,LINK";
	s = REReplace(s, "(.*),(.+)$", "\L\1 or \2", "ONE");
	s = replace(s, ",", ", ", "all");
	writeOutput(s);
</cfscript>