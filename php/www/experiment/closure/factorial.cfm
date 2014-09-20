<cfscript>
// factorial.cfm

f = function(x){
	return x > 1 ? x * f(x-1) : 1
}


echo (f(4))
</cfscript>