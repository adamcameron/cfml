<cfscript>
	o = new Test();
	st = o.outwards(initialString="Hello", finalString="World");
	dump(var=st);
</cfscript>