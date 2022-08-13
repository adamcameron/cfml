<cfscript>
needle = "match";
haystack = "source to find match";
replacement = "REPLACEMENT";

result = replace(haystack, needle, function(needle, index, haystack){
	return replacement;
});
writeOutput("Result with one replacement: [#result#]#chr(10)##chr(10)#");

haystack = "source to find either one match or another match";
result = replace(haystack, needle, function(needle, index, haystack){
	return replacement;
});
writeOutput("Result with potentially multiple replacements: [#result#]#chr(10)##chr(10)#");

result = replace(haystack, needle, function(needle, index, haystack){
	return replacement;
}, "ALL");
writeOutput("Result with potentially multiple replacements: [#result#]#chr(10)##chr(10)#");

needle = "MATCH";
result = replace(haystack, needle, function(needle, index, haystack){
	return replacement;
}, "ALL");
writeOutput("Result with potentially multiple case sensitive replacements: [#result#]#chr(10)##chr(10)#");

/*
result = replace(haystack, needle, function(needle, index, haystack){
	return replacement;
}, "ALL", true);
writeOutput("Result with potentially multiple case sensitive replacements: [#result#]#chr(10)##chr(10)#");
*/
</cfscript>