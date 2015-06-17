<cfscript>
	sMatch		= "(?=[^,]+?.*?\1";
	sReplace	= "x";
	s1			= "1,2,3,4,1,3,2,5,6,3,7,6,4,9,8,7,2,4,5";
	s2			= reReplace(s1, sMatch, sReplace, "all");
	dump(var=variables);
</cfscript>