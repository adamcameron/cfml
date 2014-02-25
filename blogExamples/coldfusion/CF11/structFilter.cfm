<cfscript>
// structFilter.cfm

base = {a="b", c="d", e="f"};

filtered = structFilter(base, function(k,v){
	return k == "a" || v =="f";
});
writeDump([base,filtered]);

try {
	filtered = base.filter(function(k,v){
		return k == "c" || v =="d";
	});
	writeDump([base,filtered]);
}catch (any e){
	writeDump([e.type,e.message,e.detail]);
}
</cfscript>