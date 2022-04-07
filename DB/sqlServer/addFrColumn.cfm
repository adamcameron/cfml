<cfscript>
queryExecute("ALTER TABLE numbers ADD fr VARCHAR(50) NULL", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='un' WHERE id=1", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='deux' WHERE id=2", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='trois' WHERE id=3", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='quatre' WHERE id=4", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='cinq' WHERE id=5", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='six' WHERE id=6", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='sept' WHERE id=7", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='huit' WHERE id=8", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='neuf' WHERE id=9", [], {datasource="scratch_mssql"});
queryExecute("UPDATE numbers SET fr='dix' WHERE id=10", [], {datasource="scratch_mssql"});
</cfscript>