<cfdump var="#session#" label="session">

<cfdump var="#[
    "application.name" = application.applicationname,
    "session.cfid" = session.cfid,
    "session.cftoken" = session.cftoken,
    "session.sessionId" = session.sessionId
]#" format="text">
