<cfscript>
writeOutput(isNull(foo.moo));
foo = {};	
writeOutput(isNull(foo.moo));
foo.moo = "bar";	
writeOutput(isNull(foo.moo));
</cfscript>