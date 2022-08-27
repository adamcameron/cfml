component {
    this.name = "testApp"
    this.applicationTimeout = createTimespan(0, 0, 0, 30)

    function onApplicationStart() {
        application.uuid = createUuid()
        logMessage(getFunctionCalledName())
    }

    function onApplicationEnd(applicationScope) {
        logMessage(getFunctionCalledName())
    }

    function logMessage(handlerName) {
        writeLog(
            file = "appStopDebug",
            text = handlerName
                & " (#getFileFromPath(getBaseTemplatePath())#)"
                & " (query_string: #CGI.query_string#)"
                & " (application?.uuid: [#application?.uuid#])")
    }
}
