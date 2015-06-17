<cfscript>
writeOutput("<h2>Normal</h2>");
normal = structNew("normal");
normal.initial	= "one";
normal.second	= "two";
normal.last		= "three";
for (key in normal){
	writeOutput(key & "<br>");
}
dump([
{dump=normal},
{keyarray=structKeyArray(normal)}
]);

writeOutput("<hr>");

writeOutput("<h2>Linked</h2>");
linked = structNew("linked");
linked.initial	= "one";
linked.second	= "two";
linked.last		= "three";
for (key in linked){
	writeOutput(key & "<br>");
}
dump([
{dump=linked},
{keyarray=structKeyArray(linked)}
]);

writeOutput("<hr>");
</cfscript>