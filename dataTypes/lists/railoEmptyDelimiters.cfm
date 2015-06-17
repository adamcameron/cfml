<cfset list = "1234567890">

<cfoutput>
<table border="1">
	<thead>
		<tr><th>operation</th><th>result</th></tr>
	</thead>
	<tbody>
		
	<tr><td>list</td><td>#list#</td></tr>
	<tr><td>listAppend()</td><td>#listAppend(list, "A", "")#</td></tr>
	<tr><td>listChangeDelims()</td><td>#listChangeDelims(list, ",", "")#</td></tr>
	<tr><td>listContains()</td><td>#listContains(list, "0", "")#</td></tr>
	<cftry>
		<tr><td>listDeleteAt()</td><td>#listDeleteAt(list, 5, "")#</td></tr>
		<cfcatch>
			#cfcatch.message# #cfcatch.detail#</td></tr>
		</cfcatch>
	</cftry>
	<tr><td>listFind()</td><td>#listFind(list, "0", "")#</td></tr>
	<tr><td>listFirst()</td><td>#listFirst(list, "")#</td></tr>
	<cftry>
		<tr><td>listGetAt()</td><td>#listGetAt(list, 5, "")#</td></tr>
		<cfcatch>
			#cfcatch.message# #cfcatch.detail#</td></tr>
		</cfcatch>
	</cftry>
	<cftry>
		<tr><td>listInsertAt()</td><td>#listInsertAt(list, 5, "")#</td></tr>
		<cfcatch>
			#cfcatch.message# #cfcatch.detail#</td></tr>
		</cfcatch>
	</cftry>
	<tr><td>listLast()</td><td>#listLast(list, "")#</td></tr>
	<tr><td>listLen()</td><td>#listLen(list, "")#</td></tr>
	<cftry>
		<tr><td>listQualify()</td><td>#listQualify(list, "'", "")#</td></tr>
		<cfcatch>
			#cfcatch.message# #cfcatch.detail#</td></tr>
		</cfcatch>
	</cftry>
	<tr><td>listRest()</td><td>#listRest(list, "")#</td></tr>
	<cftry>
		<tr><td>listSetAt()</td><td>#listSetAt(list, 5, "")#</td></tr>
		<cfcatch>
			#cfcatch.message# #cfcatch.detail#</td></tr>
		</cfcatch>
	</cftry>
	<tr><td>listSort()</td><td>#listSort(list, "numeric", "DESC", "")#</td></tr>
	<tr><td>listToArray()</td><td><cfdump var="#listToArray(list, "")#"></td></tr>
	<tr><td>listValueCount()</td><td>#listValueCount(list, 5, "")#</td></tr>
	
	<cfset q = queryNew("")>
	<cfset queryAddColumn(q, "maori", ["whero", "karaka", "kakariki"])>
	<tr><td>valueList()</td><td>#valueList(q.maori, "")#</td></tr>
	</tbody>
</table>
</cfoutput>