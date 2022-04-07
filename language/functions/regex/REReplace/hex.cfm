<cfset string = chr(129)&chr(230)>
<cfoutput>#REReplace(string, "[\x80-\xFF]", "Marmoset", "ALL")#</cfoutput>