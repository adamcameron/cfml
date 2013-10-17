<cfscript>


boolean function datePatternMatch(required string dateString, required string datePattern){
	return lsIsDate(arguments.dateString) && compareNoCase(arguments.dateString, lsDateFormat(arguments.dateString, arguments.datePattern) ) == 0;
}
</cfscript>
<cfset setLocale("French (Standard)")>
<cfoutput>
	#datePatternMatch("25 juillet 2013", "d mmmm yyyy")#<br><!---true --->
	#datePatternMatch("25 july 2013", "d mmmm yyyy")#<br><!--- false because "july" is not valid in French --->
</cfoutput>