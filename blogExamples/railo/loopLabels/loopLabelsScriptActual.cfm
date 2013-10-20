<cfscript>
loopThreshold = 3;

loopLabel: for(x=1; x <= 5; x++){	
	writeOutput("Top of loop with #x#<br>");
	if (x >= loopThreshold){
		break loopLabel;
	}
	writeOutput("Bottom of loop<br>");
}
writeOutput("After loop<br>");
</cfscript>
