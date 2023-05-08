<cfscript>
// testInLoop.cfm

header name="Content-Type" value="text/event-stream";

requestStartedAt = now()
for (i=1; i <= 10; i++) {
    data = {
        "uuid" = createUuid(),
        "now" = now().timeFormat("HH:mm:ss"),
        "requestStartedAt" = requestStartedAt.timeFormat("HH:mm:ss")
    }
    writeOutput("event: message" & chr(10))
    writeOutput('data: #serializeJson(data)#' & chr(10) & chr(10))
    flush;
    sleep(1000)
}
writeOutput("event: message" & chr(10))
writeOutput('data: #serializeJson({"complete": true})#' & chr(10) & chr(10))
flush;
</cfscript>
