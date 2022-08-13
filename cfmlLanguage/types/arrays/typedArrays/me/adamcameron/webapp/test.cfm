<cfscript>
o = new My()

safeRunner = (methodName) => {
    try {
        writeDump(o[methodName]())
    } catch (any e) {
        writeDump([
            test = methodName,
            message = e.message,
            detail = e.detail
        ])
    }
    writeOutput("<hr>")
}


safeRunner("getThings")
safeRunner("getThingsViaFqnOnReturn")
safeRunner("getThingsViaFqnOnType")
safeRunner("getThingsViaFqnOnBoth")
</cfscript>
