<cfset s1 = chr(9) & chr(10)>
<cfset i1 = len(s1)>
<cfset s2 = reReplace(s1, "[[:cntrl:]]", "", "ALL")>
<cfset i2 = len(s2)>
<cfdump var="#variables#">