<cfscript>
	numberOfRows = 2;

	testQuery = queryNew("stringField,numberField");
	
/*	
	for (i=1; i le numberOfRows; i=i+1){
		queryAddRow(testQuery); querySetCell(testQuery, "numberField", i);	querySetCell(testQuery, "stringField", "foo sux");
	}
*/
	queryAddRow(testQuery); querySetCell(testQuery, "numberField", "ooh!  it is a *string*");	querySetCell(testQuery, "stringField", "foo still sux");


	for (i=1; i le numberOfRows; i=i+1){
		queryAddRow(testQuery); querySetCell(testQuery, "numberField", i);	querySetCell(testQuery, "stringField", "foo sux");
	}

</cfscript>

<table>
	<tr>
		<td><cfdump var="#testQuery#"></td>
		<td valign="top">
			<cfquery name="result" dbtype="query">
				select stringField
				from testQuery
				
			</cfquery>
			<cfdump var="#result#">
		</td>
	
	</tr>
</table>

 