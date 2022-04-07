<cfset myString = "343DF A 788GH2">
<cfloop index="listElement" list="#myString#" delimiters=" ">
	[<cfif Len(Trim(listElement))><cfoutput>#ListElement#</cfoutput></cfif>]<br />
</cfloop>
<hr />
<cfset myString = "343DF     A     788GH2">
<cfloop index="listElement" list="#myString#" delimiters=" ">
	[<cfoutput>#ListElement#</cfoutput>]<br />
</cfloop>