<cfscript>
include "loop.cfm";

param numeric URL.iterations = 100;

start = getTickCount();
result = loop(
	function(){
		sum = 0;
		i=1;
	},
	function(){
		return i <= URL.iterations;
	},
	function(){
		i++;
	},
	function(){
		sum += i;
		return sum;
	}
);
end = getTickCount();

writeOutput("#result#<br>");
writeOutput("loop(): #end-start#ms<br><hr>");

start = getTickCount();
sum=0;
for (i=1; i <= URL.iterations; i++){
	sum += i;
}
end = getTickCount();

writeOutput("#result#<br>");
writeOutput("for (): #end-start#ms<br><hr>");
</cfscript>