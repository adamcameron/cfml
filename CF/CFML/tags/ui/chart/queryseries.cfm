<cfscript>
	qRecs = queryNew("salestotal,item_no");
	queryAddRow(qRecs);	querySetCell(qRecs, "item_no", "Foo"); querySetCell(qRecs, "salestotal", 1000);
	queryAddRow(qRecs);	querySetCell(qRecs, "item_no", "Bar"); querySetCell(qRecs, "salestotal", 1500);
	queryAddRow(qRecs);	querySetCell(qRecs, "item_no", "Jelly"); querySetCell(qRecs, "salestotal", 2000);
	queryAddRow(qRecs);	querySetCell(qRecs, "item_no", "Triangles"); querySetCell(qRecs, "salestotal", 2500);
</cfscript>

<cfoutput>#DollarFormat(arraySum(qRecs["salestotal"]))#</cfoutput>
<cfchart xAxisTitle="Item" yAxisTitle="Sales in Dollars">
	<cfchartseries type="bar" query="qRecs" valueColumn="salestotal" itemColumn="item_no">
</cfchart> 