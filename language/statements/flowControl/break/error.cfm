<cfscript>
outer:
for (x in [1,2,3,4,5]){
	for (y in [1,2,3,4,5]){
		if (x * y >= 10) break "outer";
	}
}	
</cfscript>