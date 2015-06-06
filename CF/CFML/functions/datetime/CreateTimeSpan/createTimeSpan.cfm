<cfset ts1 = createTimeSpan(0,2,0,0)>
<cfset ts2 = #createTimeSpan(0,2,0,0)#>
<cfset ts3 = "#createTimeSpan(0,2,0,0)#">

<cfdump var="#variables#">