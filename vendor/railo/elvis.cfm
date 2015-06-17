<cfscript>
	if (tahi.rua.toru.wha ?: (tahi.rua.toru.wha = 1234) == 1234){
		writeDump(tahi);
	}else{
		writeOutput("Nope");
	}
</cfscript>