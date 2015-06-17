<cfscript>
	variables.when = "bound at declaration";
	
	f = function(){
		var bind = variables.when;
		writeOutput("#bind#<br />");
	};
	
	variables.when = "bound at execution";
	f();
	
	writeDump(
		{
			isCustomFunction = isCustomFunction(f),		
			isClosure = isClosure(f)
		}
	);
</cfscript>