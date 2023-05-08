<cfscript>
telemetry = []


telemetry.append("Begin")

telemetry.append("f1 before define")
f1 = runAsync(() => {
    telemetry.append("f1 main")
}).then(() => {
    telemetry.append("f1 then1")
}).then(() => {
    telemetry.append("f1 then2")
})
telemetry.append("f1 after define")

telemetry.append("f2 before define")
f2 = runAsync(() => {
    telemetry.append("f2 main")
}).then(() => {
    telemetry.append("f2 then1")
}).then(() => {
    telemetry.append("f2 then2")
})
telemetry.append("f2 after define")

telemetry.append("f3 before define")
f3 = runAsync(() => {
    telemetry.append("f3 main")
}).then(() => {
    telemetry.append("f3 then1")
}).then(() => {
    telemetry.append("f3 then2")
})
telemetry.append("f3 after define")

telemetry.append("f1 before get")
f1.get()
telemetry.append("f1 after get")

telemetry.append("f2 before get")
f2.get()
telemetry.append("f2 after get")

telemetry.append("f3 before get")
f3.get()
telemetry.append("f3 after get")

telemetry.append("End")

writeDump(telemetry)

duplicates = telemetry
    .reduce((tally, v) => tally.insert(v, tally.keyExists(v) ? ++tally[v] : 1, true), {})
    .filter((_, v) => v > 1)

writeDump(duplicates)
</cfscript>
