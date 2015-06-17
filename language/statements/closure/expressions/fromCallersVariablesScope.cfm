<cfscript>
	variables.when = "bound at declaration";
	
	function returnClosure(){
		var bind = variables.when;	// this is where the closure takes place. bind is bound to the CURRENT value of variables.when as the function is declared
		var closure = function(){
			writeOutput("#bind#<br />");
		};
		return closure;
	}

	variables.when = "bound at execution";
	f = returnClosure();

	variables.when = "bound at calling";
	f();
	
	writeDump(
		{
			isCustomFunction = isCustomFunction(f),		
			isClosure = isClosure(f)		
		}
	);
</cfscript>