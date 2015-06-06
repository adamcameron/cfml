<cfset s1 = "bung -> " & chr(7) & "<- bung">
<cfset s2 = xmlFormat(s1, true)>

<cftry>
<cfxml variable="x">
	<top>
		<cfoutput><node>#s2#</node></cfoutput>
	</top>
</cfxml>
<cfcatch>
	<cfdump var="#variables#">
	<cfabort>
</cfcatch>
</cftry>
<cfdump var="#x#">