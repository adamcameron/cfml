<cfscript>
ordered = [
	first = 1,
	second = 2,
	third = 3,
	fourth = 4,
	fifth = 5
];
mapped = ordered.map(function(_,v){
	return v*2;
});
writeDump([ordered,mapped]);
</cfscript>