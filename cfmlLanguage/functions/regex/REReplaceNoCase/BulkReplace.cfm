<cfset s1 = "the and . , "" ' &">
<cfset regex = "(?x)	## just so I can add comments
\bthe\b	## the word 'the'. won't match 'them' etc
|	## or
\band\b	## the word 'and'
|	## or
&	## an ampersand
|	## or
""	## a double quote (escaped for CF)
|	## or
'	## a single quote (no need to escape it)
|	## or
\.	## a fullstop (escaped for regex)
|	## or
,	## a comma
">
<cfset s2 = REReplaceNoCase(s1, regex, "feet", "all")>

<cfdump var="#s2#">
 
 
