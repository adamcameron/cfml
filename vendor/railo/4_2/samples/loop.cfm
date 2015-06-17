<cfscript>
//	"so it's up to you to choose the syntax you like"
/*
	echo("<h2>for()</h2>")
	for (i=0; i<= 10; i+=2){
		echo(i)
	}
	echo("<hr>")

	echo("<h2>loop</h2>")
	loop index="i" from=0 to=10 step=2 {
		echo(i)
	}
	echo("<hr>")
	echo("<h2>cfloop()</h2>")
*/	
	cfloop (index="i", from=0, to=10, step=2){
		writeOutput(i);
	}
	//echo("<hr>")

</cfscript>