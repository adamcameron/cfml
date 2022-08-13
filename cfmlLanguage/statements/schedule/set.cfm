<cfschedule
    action="update"
    task="10sec log ping"
    url="http://localhost:8888/cfml/cfmlLanguage/statements/schedule/task.cfm"
    interval="10"
    startDate="#now()#"
    startTime="00:00"
    requesttimeout="300"
>
