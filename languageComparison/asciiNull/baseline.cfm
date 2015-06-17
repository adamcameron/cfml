<!--- baseline.cfm --->
<cfset s = "test" & chr(0)>
<cfoutput>
string: [#s#]<br>
length: [#len(s)#]<br>
bytes: <cfloop index="c" array="#listToArray(s, '')#">
	#asc(c)#
</cfloop>
</cfoutput>