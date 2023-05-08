<!---
<cfset bk[1]["Qty"] = "">
<cfset sb = IIF((isDefined('bk[1]["Qty"]') AND bk[1]["Qty"] NEQ ""),"'#bk[1]["Qty"]#'","'NULL'")>
<cfdump var="#sb#">
--->

<cfset arr1[1] = "">
<cfdump var="#variables#">

<cfset arr3[1][2][3] = "">
<cfdump var="#variables#">


<cfset arr2 = []>
<cfset arr2[1].key = "">
<cfdump var="#variables#">

<cfabort>
<cfset bk[1]["Qty"] = "">
<cfif isDefined('bk[1]["Qty"]') AND bk[1]["Qty"] NEQ "">
    <cfset sb = bk[1]["Qty"]>
<cfelse>
    <cfset sb = 'NULL'>
</cfif>
<cfdump var="#sb#">

