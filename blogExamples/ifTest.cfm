<cfscript>
include "if.cfm";

result = _if(
	randRange(0,1),
	function(){
		return "heads";
	},
	function(){
		return "tails";
	}
);
writeOutput("#result#<br><hr>");

writeDump(var=variables);
</cfscript>