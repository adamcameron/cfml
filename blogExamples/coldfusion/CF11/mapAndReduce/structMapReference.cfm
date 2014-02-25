<cfscript>
//structMapReference.cfm
original = {"one"={1="tahi"},"two"={2="rua"},"three"={3="toru"},"four"={4="wha"}};
fixed = original.map(function(k,v,st){
	st[k] = "via arg";
	return;
});
writeDump(original);

original = {"one"={1="tahi"},"two"={2="rua"},"three"={3="toru"},"four"={4="wha"}};
fixed = original.map(function(k,v,st){
	original[k] = "via direct access";
	return;
});
writeDump(original);
</cfscript>