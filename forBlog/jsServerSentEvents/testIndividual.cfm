<cfscript>
header name="Content-Type" value="text/event-stream";

requestStartedAt = now()
writeOutput("event: message" & chr(10))
writeOutput('data: #serializeJson({"uuid"=createUuid(), "requestStartedAt"=requestStartedAt})#' & chr(10) & chr(10))
flush;
sleep(1000)
</cfscript>
