<cfloop index="i" from="1" to="50">
	<cfset u = replace(createUuid(), "-", "", "ALL")>
	<cfset sU = reReplace(reReplace(u, "(.{2})", "\1-", "ALL"), "-$", "", "ONE")>
	<cfoutput><span style="font-family:'courier new'">[#sU#][#now()#]</span><br /></cfoutput>
</cfloop>