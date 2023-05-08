<cfscript>
authors = [
	{firstName="Witi", lastName="Ihimaera"},
	{firstName="Patricia", lastName="Grace"},
	{firstName="Alan", lastName="Duff"},
	{firstName="Lee", lastName="Tamahori"},	// OK: not an author
	{firstName="Keri", lastName="Hulme"}
];

arraySort(
	authors,
	function (e1, e2){
		return compare(e1.lastName, e2.lastName);
	}
);
writeDump(authors);
</cfscript>