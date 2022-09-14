<cfscript>
try {
    setting requesttimeout=10;
    queryExecute("DO SLEEP(15)", [], {result="result"})
    writeDump(result)
} catch (any e) {
    writeDump(e)
    rethrow;
}
</cfscript>
