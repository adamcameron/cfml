<cfscript>
function TitleCaseListOriginal( list, delimiters ) {

	var returnString = "";
	var isFirstLetter = true;
	
	// Loop through each character in list
	for ( i = 1; i LTE Len( list ); i = i + 1 ) {
	
		// Check if character is a delimiter
		if ( Find( Mid(list, i, 1 ), delimiters, 1 ) ) {
			
			//	Add character to variable returnString unchanged
			returnString = returnString & Mid(list, i, 1 );
			isFirstLetter = true;
				
		} else {
		
			if ( isFirstLetter ) {
			
				// Uppercase
			 	returnString = returnString & UCase(Mid(list, i, 1 ) );
				isFirstLetter = false;
					
			} else {
				
				// Lowercase
				returnString = returnString & LCase(Mid(list, i, 1 ) );
				
			}
			
		}
		
	}
	
	return returnString;
}

string function titleCaseListModern(required string list, string delimiters=" ") {
	var returnString = "";
	var isFirstLetter = true;
	
	for (var i=1; i <= len(list); i++) {
		if (find(mid(list, i, 1), delimiters, 1)) {
			returnString &= mid(list, i, 1);
			isFirstLetter = true;
			continue;
		}		
		if (isFirstLetter) {
		 	returnString &= uCase(mid(list, i, 1));
			isFirstLetter = false;
			continue;
		}
		returnString &= lCase(mid(list, i, 1));
	}
	return returnString;
}

string function titleCaseListJava(required string list, string delimiters=" ") {
	return createObject("java", "java.util.regex.Pattern").compile("(?<=^|[#delimiters#])(\w)").matcher(list).replaceAll("\u\1");
}

string function titleCaseListDraft(required string list, string delimiters=" ") {
	return reReplace(list, "(^|[#delimiters#])(\w)", "\1\u\2", "ALL");
}

	
string function titleCaseList(required string list, string delimiters=" ") {
	var regexSafeDelims =  reReplace(delimiters, "(.)(?=.)", "\1|", "ALL");
	return reReplace(list, "(^|[#regexSafeDelims#])(\w)", "\1\u\2", "ALL");
}
</cfscript>

<cfset myString = "a.christopher lynch-smith">

<cfoutput>
Before: #myString#<br>
After: #TitleCaseListOriginal(myString, ".- ")#<br>
After: #titleCaseListModern(myString, ".- ")#<br>
After: #titleCaseListDraft(myString, ".- ")#<br>
</cfoutput>