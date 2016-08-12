<cfscript>
numbers = queryExecute("SELECT * FROM numbers WHERE ID = ?", [URL.id], {datasource="scratch_mssql"});
writeDump(numbers);
</cfscript>