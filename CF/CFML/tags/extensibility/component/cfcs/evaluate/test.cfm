<cf_timeit>
 <cfscript>
 	iMax = 10000;
 	a = 1;
 	b = 2;
 	sum = b;
 	
 	test = createObject("component", "Test");
 	
 	for (i = 0; i LT iMax; i = i + 1) sum = test.sum(a, b);
 </cfscript>
</cf_timeit>