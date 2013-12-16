<cfscript>
// testLoop.cfm
include "loop.cfm";

result = loop(
	function(){
		sum = 0;
		i=1;
	},
	function(){
		return i <= 10;
	},
	function(){
		i++;
	},
	function(){
		sum += i;
		return sum;
	}
);

writeOutput("#result#<br>");
writeDump(var=variables);
</cfscript>