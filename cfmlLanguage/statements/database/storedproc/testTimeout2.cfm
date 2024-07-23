<cfscript>
try {
    startTime = getTickCount()
    cfstoredproc(procedure="test_timeout", result="procResult", timeout="5");
} finally {
    endTime = getTickCount()
    writeDump({executionTime = endTime - startTime})
}
</cfscript>
