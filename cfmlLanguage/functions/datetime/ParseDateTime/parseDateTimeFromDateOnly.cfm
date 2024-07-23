<cfflush interval="128">

<cfset dStart = createDate(1999,1,1)>
<cfloop index="i" from="1" to="10000">
	<cfset d1 = dateAdd("d", i, dStart)>
	<cfset sD = dateFormat(d1, "yyyy-mm-dd")>
	<cfset d2 = parseDateTime(sD)>
	<cfoutput>#d1# #sD# #d2# #isDate(sD)# #compare(d1, d2)#<br /></cfoutput>
</cfloop>