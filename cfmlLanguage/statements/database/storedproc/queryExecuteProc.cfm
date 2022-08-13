
<cfscript>
    try {
        startTime = getTickCount()
        queryExecute("CALL test_timeout()", {}, {timeout=5})
    } finally {
        endTime = getTickCount()
        writeDump({executionTime = endTime - startTime})
    }
    </cfscript>
