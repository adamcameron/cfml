<cfscript>
iterations = 0;
a = [2,1,4,3,6,5,8,7];
a.sort(function(v1,v2){
	variables.iterations++;
	return sgn(v1-v2);
});
writeOutput('{"size": #arrayLen(a)#, "iterations": #iterations#}');
</cfscript>