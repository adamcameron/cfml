<cfscript>
levels = [
    "Information",
    "Warning",
    "Error",
    "Fatal"
]

levels.each((level) => writeLog(file="logLevelTest", text="Logging #level#", type=level))
</cfscript>
