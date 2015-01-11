<cfscript>
// dumpTableViaSql.cfm
writeDump(var=queryExecute("SELECT * FROM article"), label="articles");
writeDump(var=queryExecute("SELECT * FROM comment"), label="comments");
writeDump(var=queryExecute("SELECT * FROM reference"), label="references");
</cfscript>