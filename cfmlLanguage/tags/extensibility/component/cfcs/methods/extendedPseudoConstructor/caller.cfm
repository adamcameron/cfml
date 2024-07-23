<cfset o = createObject("component", "child").init()>

<cfset a = structSort(o.ordering, "numeric")>

<cfdump var="#o.ordering#">
<cfloop index="i" from="1" to="#arrayLen(a)#">
	<cfoutput>[#a[i]#] [#o.ordering[a[i]]#]<br /></cfoutput>
</cfloop>
