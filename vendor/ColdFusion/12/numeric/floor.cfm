<cfset numbers = [-3.6,-3.5,-3.4,-2.6,-2.5,-2.4,-0.5,0,0.4,0.5,0.6,1.5,1.6,2]>
<cfset handlers = [int,floor,ceiling,fix,round]>
<cfoutput>
<table border="1">
	<thead>
		<tr>
			<th>x</th>
			<cfloop array="#handlers#" item="handler">
				<th>#handler.getName()#</th>
			</cfloop>
		</tr>
	</thead>
	<tbody>
		<cfloop array="#numbers#" item="x">
			<tr>
				<td>#x#</td>
				<cfloop array="#handlers#" item="handler">
					<td>#handler(x)#</td>
				</cfloop>
			</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>