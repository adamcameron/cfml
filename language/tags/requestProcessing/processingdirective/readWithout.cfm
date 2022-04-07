<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#\c.cfc" variable="sData">
<cfloop index="i" from="1" to="3">
	<cfset c = mid(sData, i, 1)>
	<cfoutput>
		[#i#][#c#][#asc(c)#]<br />
	</cfoutput>
</cfloop>