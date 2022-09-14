<cfscript>
setting requesttimeout=30;
flush interval=16;

try {
    writeLog(file="finallyDebug", text="I was called in try")
    writeOutput("Before query<br>#repeatString(" ", 100)#")
    queryExecute("DO SLEEP(120)")
    writeOutput("After query<br>#repeatString(" ", 100)#")
    writeLog(file="finallyDebug", text="I was called in try")
} catch (any e) {
    writeOutput("In catch [#e.message#]<br>#repeatString(" ", 100)#")
    writeLog(file="finallyDebug", text="I was called in catch [#e.message#]")
    rethrow;
} finally {
    // there can be only one
    //writeOutput("In finally<br>#repeatString(" ", 100)#")
    writeLog(file="finallyDebug", text="I was called in finally")
}
</cfscript>
