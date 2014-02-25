<cfscript>
//arrayMapReference.cfm
numbers = ["tahi","rua","toru","wha"];
new = numbers.map(function(v,i,a){
	a[i] = a[i].ucase();
	return v.reverse();
});	
writeDump([numbers,new]);
</cfscript>