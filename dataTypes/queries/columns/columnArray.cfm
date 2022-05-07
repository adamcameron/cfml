<cfscript>
writeDump(server.lucee.version)

records = queryExecute("SELECT * FROM test")
writeDump(records)
writeDump(records.columnArray().sort("textnocase"))
</cfscript>
