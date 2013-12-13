<cfform method="post" action="act.cfm">
	<table>
		<tr>
			<td>Team:</td>
			<td>
				<cfselect name="team" bind="cfc:Cricket.getTeams()" bindonload="true">
					<option>Select a Team</option>
				</cfselect>
			</td>
		</tr>
		<tr>
			<td>Squad</td>
			<td>
				
			</td>
		</tr>
	</table>
		
</cfform>