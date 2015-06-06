<cfscript>
/*	A quick way to test if a string is a relative URL
	@param stringToCheck      The string to check.
	@return Returns a boolean.
	@version 1, February 10, 2011 James Moberg
*/
function isRelativeURL(stringToCheck){
	var RelativeURLRegEx = "(?i)(^/)\b((?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'"".,<>?«»“”‘’]))";
	return isValid("regex", stringToCheck, RelativeURLRegEx);
}	
</cfscript>

<cfoutput>
#isRelativeURL("./fileInSameDir.cfm")#	
	
</cfoutput>