<cfscript>
operands = [-1,0,1];

operands.each(function(a){
	operands.each(function(b){
		writeOutput("#a# || #b# = #a || b#<br>");
	});
});
</cfscript>