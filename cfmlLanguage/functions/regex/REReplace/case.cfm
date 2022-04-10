<cfset sL = "marmoset">
<cfset sC = REReplace(sL, "^(.)", "\u\1\E", "ONE")>
<cfoutput>#sC#</cfoutput>