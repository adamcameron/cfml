<cfscript>
param name="URL.iterations" type="integer";

for (i=1; i <= URL.iterations; i++){
	"variable#i#" = i;
}

tally=0;
timeit("evaluate");
for (i=1; i <= URL.iterations; i++){
	tally +=evaluate("variable#i#");
}
timeit("evaluate");
writeOutput("tally: #tally#<br>");

writeOutput("<hr>");


tally=0;
timeit("array");
for (i=1; i <= URL.iterations; i++){
	tally += variables["variable#i#"];
}
timeit("array");
writeOutput("tally: #tally#<br>");
</cfscript>