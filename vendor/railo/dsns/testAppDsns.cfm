<cfscript>
writeDump(var=queryExecute("SELECT * FROM colours ORDER BY id", []));
//writeDump(var=queryExecute("SELECT * FROM numbers ORDER BY id", [], {datasource="scratch_embedded_app"}));
</cfscript>