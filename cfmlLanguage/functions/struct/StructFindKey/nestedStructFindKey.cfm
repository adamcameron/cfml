<cfscript>
	function structBuild(){
		return arguments;
	}

	st = structBuild(
		scope1	= structBuild(
			key1	= "red",
			key2	= "green",
			key3	= "blue"
		),
		scope2	= structBuild(
			key1	= "Adam",
			key2	= "Barbara",
			key3	= "Charlie"
		),
		scope3	= structBuild(
			key1	= "aardvark",
			key2	= "baboon",
			key3	= "cassowary"
		)
	);

	stScope.result = structFindKey(st, "scope2", "all");
	aKey = structFindKey(stScope, "key2", "all");
</cfscript>
<cfdump var="#variables#">