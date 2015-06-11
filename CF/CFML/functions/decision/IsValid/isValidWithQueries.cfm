<cfset q = queryNew("col1")>
<cfset queryAddRow(q)>
<cfset querySetCell(q, "col1", "str1")>
<cfset queryAddRow(q)>
<cfset querySetCell(q, "col1", "str2")>

<cfoutput>
isValid("string", q.col1): #isValid("string", q.col1)#<br />
isValid("array", q.col1): #isValid("array", q.col1)#<br />
</cfoutput>
<cfparam name="q.col1" type="string">