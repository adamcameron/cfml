<cfscript>
	o = new C();
	md = getMetadata(o);

	writeDump([o,md]);
</cfscript>