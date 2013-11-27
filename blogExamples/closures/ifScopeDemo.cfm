<cfscript>
include "if.cfm";

scope = "calling code";

_if(
	randRange(0,1),
	function(){
		var scope = "true block";
		writeDump(var=[{variables=variables.scope}, {local=scope}], label="Within true block");
	},
	function(){
		var scope = "false block";
		writeDump(var=[{variables=variables.scope}, {local=scope}], label="Within false block");
	}
);

writeDump(var=[scope], label="Back in calling code");
</cfscript>