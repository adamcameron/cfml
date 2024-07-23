<cfscript>
	a = arrayNew(1);
	a[1] = "anteater";
	a[3] = "chimp";
	a[5] = "elephant";
	
	l = arrayTolist(a);
	writeoutput("listFindNoCase(): [#l, 'chimp'#]<br />");
</cfscript>
