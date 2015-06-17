<cfschedule action="list" result="qDetails">
<cfset aCols = getMetadata(qDetails)>
<cfoutput>
	<table border="1">
		<thead>
			<tr><th>Column</th><th>Value</th></tr>
		</thead>
		<tbody>
		<cfloop index="i" from="1" to="#arrayLen(aCols)#">
			<tr>
				<td>#aCols[i].name#</td>
				<td>#qDetails[aCols[i].name][1]#&nbsp;</td>	
			</tr>
		</cfloop>
	</tbody>
	</table>
</cfoutput>