<cfoutput>
<cfset testString = de("(#chr(7)#)##chr(65)##")>
<cfset s = evaluate(testString)>
<cfloop index="i" from="1" to="#len(s)#">
	<cfset c = mid(s, i, 1)>
[#i#][#c#][#asc(c)#]<br />
</cfloop>

</cfoutput>