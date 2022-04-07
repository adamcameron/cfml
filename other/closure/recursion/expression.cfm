
<cfscript>
// expression.cfm
factorial = function(x){
	return x <= 1 ? 1 : x * factorial(x-1);
};

writeoutput("factorial(#x#): #factorial(x)#");
</cfscript>