<cfscript>
	param name="URL.word";
	
	iStart = getTickCount();
	a = ormSearch("#URL.word#", "Lorem", ["mainText"]);
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms", expand=false);
	
	q = entityToQuery(a);
</cfscript>
<cfoutput>
<table border="1">
	<tr>
		<th>Record</th>
		<th>ID</th>
		<th>Paras</th>
		<th>Words</th>
		<th>Matches</th>
		<th>Matches/Words (%)</th>
		<th>Matches/Length (%)</th>
	</tr>
<cfloop query="q">
	<tr>
		<td>#currentRow#/#recordCount#</td>		
		<td>#id#</td>		
		<td>#mainTextParaCount#</td>
		<td>#mainTextWordCount#</td>
		<td>#mainTextMatchCount#</td>
		<td>#decimalFormat((mainTextMatchCount/mainTextWordCount)*100)#</td>
		<td>#decimalFormat((mainTextMatchCount/len(mainText))*100)#</td>
	</tr>
</cfloop>
</table>
</cfoutput>