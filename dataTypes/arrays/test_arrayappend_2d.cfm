<cfset a = arrayNew(2)>

<cfset arrayAppend(a[1], "apple")>
<cfset arrayAppend(a[1], "banana")>
<cfset arrayAppend(a[1], "cherry")>

<cfset arrayAppend(a[2], "Auckland")>
<cfset arrayAppend(a[2], "Wellington")>
<cfset arrayAppend(a[2], "Christchurch")>

<cfdump var="#a#">