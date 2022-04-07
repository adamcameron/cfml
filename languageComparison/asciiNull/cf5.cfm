<!--- cf5.cfm --->
<cfset s = urlDecode("%00") & "test" & urlDecode("%00")>
<cfoutput>
string: [#s#]<br>
length: [#len(s)#]<br>
bytes:
<cfloop index="i" from="1" to="#len(s)#">
	<cfset c = mid(s, i, 1)>
	#asc(c)#&nbsp;
</cfloop>
</cfoutput>