<cfscript>
/*
	numeric function factorial(x){
		return x > 1?x * factorial(x-1): 1;
	}
*/

	numeric function factorial(x){
		if(x > 1){
			return x * factorial(x-1);
		}else{
			writeDump(getCallStack());
			return 1;
		}
	}

	numeric function factorial2(x){
		if(x > 1){
			return x * factorial2(x-1);
		}else{
			dumpCallStack();
			return 1;
		}
	}
/*
	for (i=1; i <= 5; i++){
		writeOutput(factorial(i) & "<br />");
	}
*/
	for (i=1; i <= 5; i++){
		writeOutput(factorial2(i) & "<br />");
	}
</cfscript>