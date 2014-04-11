<cfscript>
iterations = 0;
a = [5,10,5,4,6,6,5,3,3,2];
a.sort(function(v1,v2){
	variables.iterations++;
	return sgn(v1-v2);
});
writeOutput('{"size": #arrayLen(a)#, "iterations": #iterations#}');
</cfscript>