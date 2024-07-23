<cfscript>
telemetry = []
recordTelemetry = (label) => {
    lock type="exclusive" name="telemetry" timeout=1 throwontimeout=true {
        telemetry.append(label)
    }
}

recordTelemetry("Begin")

recordTelemetry("f1 before define")
f1 = runAsync(() => {
    recordTelemetry("f1 main")
}).then(() => {
    recordTelemetry("f1 then1")
}).then(() => {
    recordTelemetry("f1 then2")
})
recordTelemetry("f1 after define")

recordTelemetry("f2 before define")
f2 = runAsync(() => {
    recordTelemetry("f2 main")
}).then(() => {
    recordTelemetry("f2 then1")
}).then(() => {
    recordTelemetry("f2 then2")
})
recordTelemetry("f2 after define")

recordTelemetry("f3 before define")
f3 = runAsync(() => {
    recordTelemetry("f3 main")
}).then(() => {
    recordTelemetry("f3 then1")
}).then(() => {
    recordTelemetry("f3 then2")
})
recordTelemetry("f3 after define")

recordTelemetry("f1 before get")
f1.get()
recordTelemetry("f1 after get")

recordTelemetry("f2 before get")
f2.get()
recordTelemetry("f2 after get")

recordTelemetry("f3 before get")
f3.get()
recordTelemetry("f3 after get")

recordTelemetry("End")

writeDump(telemetry)

duplicates = telemetry
    .reduce((tally, v) => tally.insert(v, tally.keyExists(v) ? ++tally[v] : 1, true), {})
    .filter((_, v) => v > 1)

writeDump(duplicates)
</cfscript>
