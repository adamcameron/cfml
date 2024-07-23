<cfscript>
	o = createObject("component", "c");
	i = o.getA().iterator();
	while (i.hasNext()){
		writeOutput(i.next() & "<br />");
	}
</cfscript>