<cfscript>
// structMap.cfm
original = {"one"={1="tahi"},"two"={2="rua"},"three"={3="toru"},"four"={4="wha"}};
fixed = structMap(original, function(k,v){
	return v[v.keyList().first()];
});
writeDump([original,fixed]);

fixed = original.map(function(k,v){
	return v.keyList().first();
});
writeDump([original,fixed]);
</cfscript>