<cfscript>
comparator = function(e1, e2){
	e1.row += 0; // need to make sure it's not a string for the Java method call below
	var rowCompare = e1.row.compareTo(e2.row + 0);
	if (rowCompare !=0){
		return rowCompare;
	}
	e1.col += 0;
	return e1.col.compareTo(e2.col + 0);
};

data = [
	{row=3, col=3}, {row=3,col=2}, {row=3, col=1},
	{row=2, col=3}, {row=2,col=2}, {row=2, col=1},
	{row=1, col=3}, {row=1,col=2}, {row=1, col=1}
];

writeDump(var=data);
arraySort(data, comparator);
writeDump(var=data);
</cfscript>