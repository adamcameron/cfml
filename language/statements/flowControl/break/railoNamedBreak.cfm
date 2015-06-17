<cfscript>
	for (x in [1,2,3,4,5]){
		for (y in [1,2,3,4,5]){
			z = x * y;
			echo(z);
			if (z > 10) break "something";
		}
	}
</cfscript>