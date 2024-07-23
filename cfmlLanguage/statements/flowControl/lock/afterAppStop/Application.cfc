component {
	this.name = getDirectoryFromPath(getCurrentTemplatePath()).listLast("/") & "01"
    this.applicationTimeout = createTimespan(0, 0, 0, 30)

    function onApplicationStart() {
        application.uuid = createUuid()
        logMessage("START " & getFunctionCalledName())
        sleep(3000)
        logMessage("END " & getFunctionCalledName())
    }

    function onApplicationEnd(applicationScope) {
        logMessage(getFunctionCalledName())
    }

	function onRequestStart() {
		logMessage("START " & getFunctionCalledName())
	}

	function onRequest(template){
		include template
	}

	function onRequestEnd() {
		logMessage("END " & getFunctionCalledName())
	}

    function logMessage(message) {
        writeLog(
            file = this.name,
            text = message
                & " (#getFileFromPath(getBaseTemplatePath())#)"
                & " (query_string: #CGI.query_string#)"
                & " (application?.uuid: [#application?.uuid#])")
    }
}
