<cfscript>
// structNew.cfm	

normal = structNew();
normal.first = 1;
normal.second = 2;
normal.third = 3;
normal.fourth = 4;
normal.fifth = 5;	

normal.each(function(k,v){
	writeOutput("#k#: #v#<br>");
});
writeOutput("<hr>");

ordered = structNew("ordered");
ordered.first = 1;
ordered.second = 2;
ordered.third = 3;
ordered.fourth = 4;
ordered.fifth = 5;	

ordered.each(function(k,v){
	writeOutput("#k#: #v#<br>");
});
</cfscript>