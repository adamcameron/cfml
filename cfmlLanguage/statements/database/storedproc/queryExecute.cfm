
<cfscript>
try {
    startTime = getTickCount()
    queryExecute("SELECT SLEEP(10)", {}, {timeout=5})
} finally {
    endTime = getTickCount()
    writeDump({executionTime = endTime - startTime})
}
</cfscript>
