<cfscript>
a = arrayNew(1);
a[2] = "rua";

for (i=1; i <= 3; i++){
	try {
		writeOutput("#i#: #arrayIsDefined(a, i)#<br />");
	} catch (any e){
		writeDump(e);
	}
}
writeDump(a);
</cfscript>