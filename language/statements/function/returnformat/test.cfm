<cfscript>
	o = new C();

	writeDump([
		{control=o.control()},
		{viaTags=o.viaTags()},
		{viaAttribute=o.viaAttribute()},
		{viaAnnotation=o.viaAnnotation()}
	]);
</cfscript>