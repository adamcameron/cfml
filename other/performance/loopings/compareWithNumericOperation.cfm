<cfscript>
// compareWithNumericOperation.cfm

param name="URL.iterations" type="integer" default=0;

writeoutput("Running #URL.iterations# iterations<br><br>");

array = [];
for (i=1; i <= URL.iterations; i++){
	array.append(i);
}

include "numericOperationTagBasedTests.cfm";

sum=0;
start = getTickCount();
for (i=0; i <= URL.iterations; i++){
	sum = sum + i;
}
end=getTickCount();
writeOutput("for (general) took #end-start#ms<hr>");

sum=0;
start = getTickCount();
for (i in array){
	sum = sum + i;
}
end=getTickCount();
writeOutput("for (array) took #end-start#ms<hr>");

handler = function(i){
	sum = sum + i;
};

sum = 0;
start = getTickCount();
array.each(handler);
end=getTickCount();
writeOutput("each() with pre-defined handler took #end-start#ms<hr>");

sum = 0;
start = getTickCount();
array.each(function(i){
	sum = sum + i;
});
end=getTickCount();
writeOutput("each() with inline handler took #end-start#ms<hr>");

start = getTickCount();
array.reduce(function(sum, i){
	return sum + i;
}, 0);
end=getTickCount();
writeOutput("reduce() took #end-start#ms<hr>");

</cfscript>
