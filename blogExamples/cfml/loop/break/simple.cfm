<cfscript>
outer:
for (x in [1,2,3,4,5]){
	echo("{");
	for (y in [1,2,3,4,5]){
		echo("[");
		z = x * y;
		echo(z);
		if (z >= 10){
			break "outer"; // break to statement after the labelled one
		}
		echo("]");
	}
	echo("}<br>");
}
</cfscript>