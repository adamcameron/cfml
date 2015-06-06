<cfset s = "donaldduck">
<cfset l = reReplace(s, "(.)", "\1,", "ALL")>
<cfoutput>
#l#<br />
#listLen(l)#<br />
#listLast(l)#<br />
</cfoutput>