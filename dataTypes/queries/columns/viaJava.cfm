<cfscript>
numbers = queryExecute("
	SELECT *
	FROM numbers
", [], {datasource="scratch_mysql"});	


colViaCf = [];
colViaCf.append(numbers["mi"], true);
colViaCf.append("tekau ma tahi");

writeDump(colViaCf);
writeOutput(colViaCf.getClass().getName());


colViaJava = numbers.mi.toArray();
writeDump(colViaJava);
writeOutput(colViaJava.getClass().getName());

try {
	colViaJava.append("tekau ma tahi");
} catch (any e){
	writeDump(e);
}
try {
	arrayAppend(colViaJava, "tekau ma tahi");
} catch (any e){
	writeDump(e);
}
</cfscript>

