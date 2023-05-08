<cfscript>
iterations = 0;
numbers = [1,2,3,4];
numbers.each(function(v,i){
	iterations++;
	writeOutput("#iterations#<br>");
});
</cfscript>