<cfscript>
// trimToWord.cfm
string function trimToWord(required string string, required numeric index){
	return reReplace(string, "^((?:.{1,#index#}(?=\s|$)\b)|(?:.+?\b)).*", "\1", "ONE");
}	
</cfscript>