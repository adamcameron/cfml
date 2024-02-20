<cfscript>
	numbers = [511.925,512.925,654.925,655.925]
	functions = [
		"decimalFormat(##x##)",
		"right(dollarFormat(##x##), -1)",
		'numberFormat(##x##, "9.00")'
	]
</cfscript>
<cfoutput>
<table border="1">
	<tr>
		<th>f\x</th>
		<cfloop index="x" array="#numbers#"><th>#x#</th></cfloop>
	</tr>
	<cfloop index="f" array="#functions#">
		<tr>
			<td>#f#</td>
			<cfloop index="x" array="#numbers#">
				<td>#evaluate(f)#</td>
			</cfloop>
		</tr>
	</cfloop>
</table>
</cfoutput>
