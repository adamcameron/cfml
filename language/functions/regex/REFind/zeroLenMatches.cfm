<cfset s = "">
<cfset sRegex = "^[A-Za-z']*$">

<cfset i = reFind(sRegex, s)>
<cfoutput>#i#</cfoutput><br />

<cfset b = s.matches(sRegex)>
<cfoutput>#b#</cfoutput><br />