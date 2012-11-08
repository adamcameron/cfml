<cfscript>
	o = new AdobeBugs();
	q = o.search(URL.criteria);
	writeDump(variables);
</cfscript>