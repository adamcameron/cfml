<cfscript>
a = ["a", "b", "c"]	;
result = arrayFilter(a, function(v,i,a,x){
	writeDump(arguments);
	return true;
});
writeDump(result);

result = directoryList(expandPath("."), true, "array", function(f,g="default"){
	writeDump(arguments);
	return true;
});
writeDump(result);
</cfscript>