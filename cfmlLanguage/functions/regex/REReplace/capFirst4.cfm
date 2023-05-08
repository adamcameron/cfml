<cfset sMatch = "(?=\W)([a-z])(?=\w+)">
<cfset sReplace = "\u\1">

<cfset s = "the quick brown fox jumps over the lazy dog. this'll not impact apostrophes">

<cfoutput>
	#s#<br />
	#reReplaceNoCase(s, sMatch, sReplace, "ALL")#<br />
</cfoutput>