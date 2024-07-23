<cfscript>
eg1 = {
	initial = "second",
	second	= "last",
	last	= "final"
};
for (key in eg1){
	writeOutput(key & "<br>");
}

original = "initial";
result = replaceNoCase(original, eg1);
writeDump([original, result]);

writeOutput("<hr>");

eg2 = {
	one = "two",
	two	= "three",
	three	= "final"
};
for (key in eg2){
	writeOutput(key & "<br>");
}

original = "one";
result = replaceNoCase(original, eg2);
writeDump([original, result]);
</cfscript>