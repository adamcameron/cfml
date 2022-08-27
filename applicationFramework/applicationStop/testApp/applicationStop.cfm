<cfscript>
writeLog(file="appStopDebug", text="START applicationStop.cfm (application?.uuid: [#application?.uuid#])")
applicationStop()
writeLog(file="appStopDebug", text="END applicationStop.cfm (application?.uuid: [#application?.uuid#])")
</cfscript>
