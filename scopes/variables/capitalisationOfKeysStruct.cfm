<cfscript>
st.dotNotation = 0;
st['associativeArrayNotation'] = 0;
structInsert(st, "structInsert", 0, true);
j.direct = serializeJson(st);
</cfscript>

<table border="1">
<tr>
	<td>Variable/scope</td>
	<td>JSON</td>
</tr>
<cfloop collection="#j#" item="key">
	<tr>
		<cfoutput>
			<td>#key#</td>
			<td>#j[key]#</td>
		</cfoutput>
	</tr>
</cfloop>
</table>
	