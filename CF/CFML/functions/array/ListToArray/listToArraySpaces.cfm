<cfset str = ", A , B , , , 0">
<cfset str = replace(str, " ", "", "ALL")>
<cfset arr = listToArray(str, ",", true)>
<cfdump var="#arr#">

<cfloop index="i" from="1" to="#arrayLen(arr)#">
<cfoutput>[#arr[i]#]<br /></cfoutput>
</cfloop>
