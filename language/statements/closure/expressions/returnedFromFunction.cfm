<cfscript>
	variables.when = "bound at declaration";
	
	function returnClosure(){
		return function(){
			var bind = variables.when;
			writeOutput("#bind#<br />");
		};
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