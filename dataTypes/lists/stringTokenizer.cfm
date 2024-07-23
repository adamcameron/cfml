<cf_timeit>
<cfscript>
	if (not structKeyExists(url, "max")) url.max = 1;
	l ="";
	for (i=1; i le url.max; i=i+1){
		l = listAppend(l, createUUID());
	}
</cfscript>
</cf_timeit>
<hr />
<cf_timeit>
	<cfloop index="element" list="#l#">
		<cfset s = element>
	</cfloop>
</cf_timeit>
<hr />
<cf_timeit>
	<cfscript>
		oST = createObject("java", "java.util.StringTokenizer");
		oST = oST.init(l, ",");
		while (oST.hasMoreElements()){
			s = oST.nextElement();
		}		
	</cfscript>
</cf_timeit>
<hr />