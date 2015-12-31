<cfscript>
numbers = queryExecute("SELECT * FROM numbers",[],{datasource="scratch_mysql"});
writeDump(numbers);	
</cfscript>