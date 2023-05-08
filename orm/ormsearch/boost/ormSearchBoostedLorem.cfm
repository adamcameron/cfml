<cfscript>
	param name="URL.word";
	
	iStart = getTickCount();
	a = ormSearch("#URL.word#", "BoostedLorem", ["mainText","subText"]);
	writeDump(var=a, label="Execution Time: #getTickCount()-iStart#ms", expand=false);
	
	q = entityToQuery(a);
</cfscript>
<cfoutput>
<table border="1">
	<tr>
		<th colspan="2">&nbsp;</th>
		<th colspan="6">Main</th>
		<th colspan="6">Sub</th>
	</tr>
	<tr>
		<th>Record</th>
		<th>ID</th>
		<th>Paras</th>
		<th>Words</th>
		<th>Matches</th>
		<th>M/W (%)</th>
		<th>M/Len (%)</th>
		<th>First match @</th>
		<th>Paras</th>
		<th>Words</th>
		<th>Matches</th>
		<th>M/W (%)</th>
		<th>M/Len (%)</th>
		<th>First match @</th>
	</tr>
<cfloop query="q">
	<tr>
		<td>#currentRow#/#recordCount#</td>		
		<td>#id#</td>		
		<td>#mainTextParaCount#</td>
		<td>#mainTextWordCount#</td>
		<td>#mainTextMatchCount#</td>
		<td>#decimalFormat((mainTextMatchCount/mainTextWordCount)*100)#%</td>
		<td>#decimalFormat((mainTextMatchCount/len(mainText))*100)#%</td>
		<td>#find(URL.word, mainText)#</td>
		<td>#subTextParaCount#</td>
		<td>#subTextWordCount#</td>
		<td>#subTextMatchCount#</td>
		<td>#decimalFormat((subTextMatchCount/subTextWordCount)*100)#%</td>
		<td>#decimalFormat((subTextMatchCount/len(subText))*100)#%</td>
		<td>#find(URL.word, subText)#</td>
	</tr>
</cfloop>
</table>
</cfoutput>