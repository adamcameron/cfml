<cfscript>
// queryColumnCasing.cfm
selectStar = queryExecute("SELECT * FROM casing",[],{datasource="scratch_mssql"});
selectColumns = queryExecute("SELECT allcaps,ALLLOWERCASE, mixedCASE FROM casing",[],{datasource="scratch_mssql"});

writeDump(var=variables);
writeDump(selectStar.getMetadata().getColumnLabels());
writeDump(selectColumns.getMetadata().getColumnLabels());
</cfscript>