<cfscript>
	rowMax = 3000;
	aWrap = 1000;

	q = queryNew("col");
	
	for (i=1; i le rowMax; i=i+1){
		queryAddRow(q);
		querySetCell(q, "col", "Query Data [#i#]");
	}
</cfscript>	

<cf_timeit>
<cfscript>
	iArrayRows = ceiling(q.RecordCount/aWrap);
	
	a = arrayNew(2);
	
	for (i=0; i lt iArrayRows; i=i+1){
		for (j=1; j le aWrap; j=j+1){
			iRecordPosition = aWrap * i;
			iRecordPosition = iRecordPosition + j;
			a[i +1][j]= q.col[iRecordPosition];
		}
	}
</cfscript>
</cf_timeit>

<cfoutput>

<cf_timeit>
<cfloop index="i" from="1" to="10" >
First item: #a[1][1]#<br />
One-thousand and fiftieth item:  #a[2][50]#<br />
Two-thousand, seven hundred, and tenth item: #a[3][710]#<br />
</cfloop>
</cf_timeit>
<br />
<cf_timeit>
<cfloop index="i" from="1" to="10" >
First item: #q.col[1]#<br />
One-thousand and fiftieth item:  #q.col[2050]#<br />
Two-thousand, seven hundred, and tenth item: #q.col[2710]#<br />
</cfloop>
</cf_timeit>

</cfoutput>
