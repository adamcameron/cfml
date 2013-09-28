<cfscript>
a = [
	{firstName="Witi", lastName="Ihimaera"},
	{firstName="Patricia", lastName="Grace"},
	{firstName="Alan", lastName="Duff"},
	{firstName="Lee", lastName="Tamahori"},	// OK: not an author
	{firstName="Keri", lastName="Hulme"}
];

arraySort(
	a,
	function (e1, e2){
		return compare(e1.lastName, e2.lastName) > 0;
	}
);
writeDump(a);
</cfscript>