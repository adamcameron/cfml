<cfscript>
a1 = arrayNew(1);
writeDump(var=a1, label="One-dimensional array");

a2 = arrayNew(3);
writeDump(var=a2, label="Three-dimensional array?");

writeOutput(a2.toString() & "<br />");

writeOutput(a1.equals(a2) & "<br />");
try {
	a3 = arraynew(4);  // nu-uh
	
}
catch (any e) {
	st = {
		type	= e.type,
		message	= e.message,
		detail	= e.detail
	};
	writeDump(st);
}

a4 = arrayNew();
</cfscript>