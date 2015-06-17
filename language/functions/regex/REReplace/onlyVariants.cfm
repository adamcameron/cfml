<cfset s1 = "and bum candle dumb errand fumble gander humble ireland jumble">
<cfset s2 = REReplace(s1, ".*?(\w*and\w*)?.*?", "\1,", "ALL")>
<cfset a = listToArray(s2)>
<cfoutput>#s2#</cfoutput>
<cfdump var="#a#">