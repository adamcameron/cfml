<cfset operators = ["XOR","EQV","IMP"]>
<cfset operands = [true,false]>
<cfoutput>
<cfloop index="operator" array="#operators#">
	<table border="1">
		<thead>
			<tr><th>A #operator# B</th><th>B=#operands[1]#</th><th>B=#operands[2]#</th></th>
		</thead>
		<tbody>
			<cfloop index="a" array="#operands#">
				<tr>
					<th>A=#a#</th>
				<cfloop index="b" array="#operands#">
					<td>#evaluate("#a# #operator# #b#")#</td>
				</cfloop>
				</tr>
			</cfloop>
		</tbody>
	</table>
	<hr>
</cfloop>
</cfoutput>