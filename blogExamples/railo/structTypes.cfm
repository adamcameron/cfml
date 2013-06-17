<cfscript>
original = structNew();
normal = structNew("normal");
linked = structNew("linked");
weak = structNew("weak");
literal = {};
dump([
	{original=original.getClass().getName()},	
	{normal=normal.getClass().getName()},	
	{linked=linked.getClass().getName()},	
	{weak=weak.getClass().getName()},	
	{literal=literal.getClass().getName()}	
]);
</cfscript>