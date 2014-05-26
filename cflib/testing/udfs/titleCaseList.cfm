<cfscript>
string function titleCaseList(required string list, string delimiters=" ") {
	var regexSafeDelims =  reReplace(delimiters, "(.)(?=.)", "\1|", "ALL");
	return reReplace(list, "(^|[#regexSafeDelims#])(\w)", "\1\u\2", "ALL");
}
</cfscript>