<cfscript>
start = getTickCount()
writeLog(file="runAsync", text="Begin @ #getTickCount() - start#")


writeLog(file="runAsync", text="f1 before define @ #getTickCount() - start#")
f1 = runAsync(() => {
    writeLog(file="runAsync", text="f1 main before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f1 main after query @ #getTickCount() - start#")
}).then(() => {
    writeLog(file="runAsync", text="f1 then1 before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f1 then1 after query @ #getTickCount() - start#")
}).then(() => {
    writeLog(file="runAsync", text="f1 then2 before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f1 then2 after query @ #getTickCount() - start#")
})
writeLog(file="runAsync", text="f1 after define @ #getTickCount() - start#")


writeLog(file="runAsync", text="f2 before define @ #getTickCount() - start#")
f2 = runAsync(() => {
    writeLog(file="runAsync", text="f2 main before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f2 main after query @ #getTickCount() - start#")
}).then(() => {
    writeLog(file="runAsync", text="f2 then1 before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f2 then1 after query @ #getTickCount() - start#")
}).then(() => {
    writeLog(file="runAsync", text="f2 then2 before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f2 then2 after query @ #getTickCount() - start#")
})
writeLog(file="runAsync", text="f2 after define @ #getTickCount() - start#")


writeLog(file="runAsync", text="f3 before define @ #getTickCount() - start#")
f3 = runAsync(() => {
    writeLog(file="runAsync", text="f3 main before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f3 main after query @ #getTickCount() - start#")
}).then(() => {
    writeLog(file="runAsync", text="f3 then1 before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f3 then1 after query @ #getTickCount() - start#")
}).then(() => {
    writeLog(file="runAsync", text="f3 then2 before query @ #getTickCount() - start#")
    queryExecute("CALL sleep_and_return(1)", [], {datasource="test"});
    writeLog(file="runAsync", text="f3 then2 after query @ #getTickCount() - start#")
})
writeLog(file="runAsync", text="f3 after define @ #getTickCount() - start#")


writeLog(file="runAsync", text="f1 before get @ #getTickCount() - start#")
f1.get()
writeLog(file="runAsync", text="f1 after get @ #getTickCount() - start#")

writeLog(file="runAsync", text="f2 before get @ #getTickCount() - start#")
f2.get()
writeLog(file="runAsync", text="f2 after get @ #getTickCount() - start#")

writeLog(file="runAsync", text="f3 before get @ #getTickCount() - start#")
f3.get()
writeLog(file="runAsync", text="f3 after get @ #getTickCount() - start#")


writeLog(file="runAsync", text="End @ #getTickCount() - start#")
</cfscript>
