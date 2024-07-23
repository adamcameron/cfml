<cfset sOriginal = "(Here's how one makes a non-capturing group){0}">
<cfset sEscaped = reEscape(sOriginal)>
<cfset iResult = reFind(sEscaped, "a" & sOriginal)>
<cfdump var="#variables#">