<cfscript>
	objects = [
		new TagBased(),
		new TagBased(),
		new TagBased()
	];
	writeDump(objects);

	objects[1].notContains();
	objects[1].contains();
</cfscript>