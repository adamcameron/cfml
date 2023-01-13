component {

    param name="URL.sessionTimeoutSeconds" default=5;

    this.name ="testingSessionLifecycleShiz01"
    this.sessionManagement = true
    this.sessionTimeout = createTimespan(0, 0, 0, URL.sessionTimeoutSeconds)

    function onRequestStart() {
        session.lastRequested = getTickCount()
        logDebug("#getFunctionCalledName()# #CGI.script_name# #session.sessionid#")
    }

    function onRequest(requestedFile) {
        logDebug("#getFunctionCalledName()# #session.sessionid#")
        include requestedFile;
    }

    function onSessionStart() {
        logDebug("#getFunctionCalledName()# #CGI.script_name# #session.sessionid#")
    }

    function onSessionEnd(sessionScope) {
        var endedAfter = getTickCount() - sessionScope.lastRequested
        logDebug("#getFunctionCalledName()# ended after #endedAfter#ms #sessionScope.sessionid#")
    }

    function logDebug(text) {
        writeLog(file="sessionDebug", text=text, application=false)
    }

}
