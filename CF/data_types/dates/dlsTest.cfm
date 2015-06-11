<cfset d1 = createDateTime(2009, 03, 29, 00, 00, 00)>
<cfset d2 = createDateTime(2009, 03, 29, 02, 00, 00)>

<cfoutput>#datediff("h", d1, d2)#</cfoutput>