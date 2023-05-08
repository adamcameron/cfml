<!--- test.cfm --->
<cfscript>
	o = new My();
	md1 = getMetadata(o);
	md2 = getMetadata(o);

	writeDump(var=md1.functions, label="m1 before");
	writeDump(var=md2.functions, label="m2 before");
	writeOutput("<hr />");
	md1.functions[1].hint = "How many places will this show up in?";
	writeDump(var=md1.functions, label="m1 after");
	writeDump(var=md2.functions, label="m2 after");
</cfscript>