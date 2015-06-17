<cfset booleans="true,false">
<table border="1">
	<thead>
		<tr>
			<th>X</th>
			<th>Y</th>
			<th>X IMP Y</th>
			<th>NOT X OR Y</th>
		</tr>
	</thead>
	<tbody>
	<cfloop index="x" list="#booleans#">
		<cfloop index="y" list="#booleans#">
			<tr>
				<cfoutput>
				<td>#X#</th>
				<td>#Y#</th>
				<td>#X IMP Y#</th>
				<td>#NOT X OR Y#</th>
				</cfoutput>
			</tr>
		</cfloop>	
	</cfloop>
	</tbody>
</table>
