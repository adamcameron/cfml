<cfset temp = 7.650>
<cfoutput>#temp#: #isNumeric(temp)#</cfoutput><br />

<cfset temp = "7.650">
<cfoutput>#temp#: #isNumeric(temp)#</cfoutput><br />

<cfset temp = "  7.650">
<cfoutput>#temp#: #isNumeric(temp)#</cfoutput><br />

<cfset temp = "7.650  ">
<cfoutput>#temp#: #isNumeric(temp)#</cfoutput><br />
