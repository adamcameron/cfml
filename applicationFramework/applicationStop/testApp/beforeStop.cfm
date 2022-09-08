<cfscript>
writeLog(file="appStopDebug", text="START beforeStop.cfm (query_string: #CGI.query_string#) (application?.uuid: [#application?.uuid#])")
sleep(10000)
writeLog(file="appStopDebug", text="END beforeStop.cfm (query_string: #CGI.query_string#) (application?.uuid: [#application?.uuid#])")
</cfscript>
