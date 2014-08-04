<cfscript>
//each.cfm
a = ["a"];
a[3] = "c";

a.each(function(v,i,a){
	writeOutput("value: #v#<br>");
});
</cfscript>