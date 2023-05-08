<cfscript>
// test.cfm

records = queryExecute("SELECT * FROM records");
writeDump(var=records);
</cfscript>