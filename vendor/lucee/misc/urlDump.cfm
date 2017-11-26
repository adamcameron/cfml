<cfscript>
writeDump(URL);
URL.each(function(v,k){
	writeOutput("[#k#][#v#]<br>");
});
</cfscript>