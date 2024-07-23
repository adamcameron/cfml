<cfset fromDate = "01/01/2024">
<cfset toDate = "01/10/2024">
<cfloop from="#fromDate#" to="#toDate#" index="i" step="#CreateTimeSpan(1,0,0,0)#">
    <cfoutput>#dateformat(i, "mm/dd/yyyy")#<br></cfoutput>
</cfloop>
