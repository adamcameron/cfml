<cfflush interval="16">
<cfscript>
	sCsv = fileRead(expandPath("./complex.csv"));
	
	oCsv = new Csv(csvData=sCsv, hasheaders=true, strict=true);
	
	q = oCsv.toQuery();
	a = oCsv.toArray();
	
	writeDump(variables);
</cfscript>
<cfoutput>
<pre>
#sCsv#
</pre>
</cfoutput>