<cfscript>
// queryExecute.cfm
savecontent variable="sql" {
	include "sql.cfm";
}
numbers = queryExecute(sql, params,	{datasource="scratch_mssql"});
writeDump(numbers);
</cfscript>