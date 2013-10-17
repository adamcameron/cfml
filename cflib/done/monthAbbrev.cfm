<cfscript>
function monthAbbrev(monthNum) {
	return lsDateFormat("01-#monthNum#-01", "mmm"); // the year and the date are insignificant
}

</cfscript>
<cfoutput>
	<cfloop from="1" to="12" index="m">
		monthAbbrev(#m#): #monthAbbrev(m)#<br />
	</cfloop>
</cfoutput>