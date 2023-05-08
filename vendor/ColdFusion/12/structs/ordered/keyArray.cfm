<cfscript>
normal = {
	first = 1,
	second = 2,
	third = 3,
	fourth = 4,
	fifth = 5
};

writeDump(normal.keyArray());

ordered = [
	first = 1,
	second = 2,
	third = 3,
	fourth = 4,
	fifth = 5
];
writeDump(ordered.keyArray());
writeDump(structKeyArray(ordered));

</cfscript>