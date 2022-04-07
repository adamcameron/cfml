<cfscript>
results = [
	{factor1=3,factor2=6},
	{factor1=3,factor2=5},
	{factor1=3,factor2=4},
	{factor1=2,factor2=3},
	{factor1=2,factor2=2},
	{factor1=1}
];

sortedResults = results.sort(function(e1,e2){
	return sgn(e1.factor1 - e2.factor1) || sgn(e1.factor2 - e2.factor2);
});

writeDump(sortedResults);
writeDump(results);


</cfscript>