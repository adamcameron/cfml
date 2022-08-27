<cfscript>
writeLog(file="appStopDebug", text="START afterStop.cfm (application?.uuid: [#application?.uuid#])")
sleep(5000)
writeLog(file="appStopDebug", text="END afterStop.cfm (application?.uuid: [#application?.uuid#])")
</cfscript>
