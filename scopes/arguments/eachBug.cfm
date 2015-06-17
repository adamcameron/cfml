<cfscript>
// eachBug.cfm

safe = function(work){
	try {
		work();
	}
	catch (any e){
		writeOutput("ERRORED. [#e.type#] [#e.message#] [#e.detail#]<br>");
	}
};

iterateArgs = function(){
	arguments.each(function(){
		writeDump(var=arguments);
	});
};

writeOutput("<h3>No args</h3>");
safe(function(){
	iterateArgs();
});

writeOutput("<hr><h3>ordered args</h3>");
safe(function(){
	iterateArgs("tahi", "rua", "toru", "wha");
});

writeOutput("<hr><h3>named args</h3>");
safe(function(){
	iterateArgs(one="tahi", two="rua", three="toru", four="wha");
});

writeOutput("<hr><h3>struct</h3>");
numbers = {one="tahi", two="rua", three="toru", four="wha"};
numbers.each(function(){
	writeDump(var=arguments);
});

writeOutput("<hr><h3>array</h3>");
numbers = ["tahi", "rua", "toru", "wha"];
numbers.each(function(){
	writeDump(var=arguments);
});
</cfscript>