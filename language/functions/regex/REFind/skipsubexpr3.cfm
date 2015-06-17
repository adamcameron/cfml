<cfset s = "foo">
<cfset regex1 = "(f)oo">
<cfset regex2 = "(?:f)oo">
<cfdump var="#REFind(regex1, s, 1, true)#" label="Note there's two groups returned: the whole thing and the 'f'">
<cfdump var="#REFind(regex2, s, 1, true)#" label="Note there's only the one group returned">

