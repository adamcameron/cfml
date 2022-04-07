<cfscript>
Function function exampleClosure(arg1){
 
	function exampleReturned(innerArg) { 
		return innerArg + owner.arg1; 
	} 
	/* return a reference to the inner function defined. */
	return exampleReturned; 
}

closure = exampleClosure(42);

writeOutput(closure(1138));
</cfscript>
