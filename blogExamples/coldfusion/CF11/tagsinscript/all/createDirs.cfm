<cfscript>
	tags = fileRead("tags.txt").toArray();
	writeDump(var=tags);
</cfscript>