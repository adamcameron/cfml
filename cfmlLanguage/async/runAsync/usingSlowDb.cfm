<cfscript>
lap = () => "@ #getTickCount() - start#"

doTimedTask = (label, task) => {
    telemetry.append("#label#: begin #lap()#")
    task()
    telemetry.append("#label#: end #lap()#")
}

doTimedDbTask = (label) => {
    doTimedTask(label,  () => queryExecute("CALL sleep_and_return(1)", [], {datasource="test"}))
}

makeFuture = (id, telemetry) => {
    return runAsync(() => {
        doTimedDbTask("f#id#")
    }).then(() => {
        doTimedDbTask("f#id# then1")
    }).then(() => {
        doTimedDbTask("f#id# then2")
    })
}

telemetry = []
start = getTickCount()

doTimedTask("Creating futures", () => {
    f1 = makeFuture(1, telemetry)
    f2 = makeFuture(2, telemetry)
    f3 = makeFuture(3, telemetry)
})

doTimedTask("Getting f1", () => {
    f1.get()
})

doTimedTask("Getting f2", () => {
    f2.get()
})

doTimedTask("Getting f3", () => {
    f3.get()
})

telemetry.each((t) => writeOutput(t & "<br>"))
</cfscript>
