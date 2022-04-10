<cfscript>
numbers = ["tahi", "rua", "toru", "wha"];

arrayEach(numbers, function(number, index, array){
	writeOutput("Current element: #number#<br>");
	writeOutput("Current index: #index#<br>");
	if (index > 1) return;
	writeDump(var=array, label="Whole array");
});	
</cfscript>