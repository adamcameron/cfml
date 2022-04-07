<cfscript>
	if(!randRange(0,1)){
		writeOutput("heads");
	}else{
		writeOutput("tails");
	}
</cfscript>