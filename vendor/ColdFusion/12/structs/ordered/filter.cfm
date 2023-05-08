<cfscript>
ordered = [
	first = 1,
	second = 2,
	third = 3,
	fourth = 4,
	fifth = 5
];
mapped = ordered.filter(function(_,v){
	return v MOD 2;
});
writeDump([ordered,mapped]);
</cfscript>