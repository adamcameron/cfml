<cfscript>
// arrayMapSparse.cfm
a = [1];
a[3] = 3;
writeDump(a);

result = a.map(function(v,i,a){
	if (structKeyExists(arguments, "v")){
		return v^2;
	}
});
writeDump(result);

result = a.map(function(v=0,i,a){
	return v^2;
});
writeDump(result);

</cfscript>