component {
    this.name = "testAbortEvent01"


    function onApplicationStart() {
        logIt(getFunctionCalledName())
    }

    function onSessionStart() {
        logIt(getFunctionCalledName())
    }

    function onRequestStart() {
        logIt(getFunctionCalledName())
    }

    function onRequest(template) {
        include template;
    }

    function onAbort() {
        logIt(getFunctionCalledName())
    }

    function onRequestEnd() {
        logIt(getFunctionCalledName())
    }

    function onSessionEnd() {
        logIt(getFunctionCalledName())
    }

    function onApplicationEnd() {
        logIt(getFunctionCalledName())
    }

    function logIt(source) {
        writeLog(file=this.name, text="#source# handler fired")
    }
}
