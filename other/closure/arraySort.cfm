<cfscript>
// arraySort.cfm
a = [
	{maori="rua", numeric=2},
	{maori="wha", numeric=4},
	{maori="tahi", numeric=1},
	{maori="toru", numeric=3}
];
writeDump(a);
a.sort(function(v1,v2){
	return sgn(v1.numeric - v2.numeric);
});
writeDump(a);
</cfscript>