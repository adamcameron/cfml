<cfscript>
writeLog(file="appStopDebug", text="==================== TEST STARTED ====================")

port = server.coldfusion.productname contains "ColdFusion" ? 8500 : 8888;

writeOutput("Running start.cfm<br>")
cfhttp(url="http://localhost:#port#/cfml/applicationFramework/applicationStop/testApp/start.cfm", timeout=0);

for (i=1; i <= 3; i++) {
    testUrl = "http://localhost:#port#/cfml/applicationFramework/applicationStop/testApp/beforeStop.cfm?i=#i#"
    writeOutput("Calling #testUrl#<br>")
    thread name="t#i#" action="run" testUrl=testUrl {
        cfhttp(url=attributes.testUrl, timeout=0);
    }
}

sleep(3000)

writeOutput("Running applicationStop.cfm<br>")
cfhttp(url="http://localhost:#port#/cfml/applicationFramework/applicationStop/testApp/applicationStop.cfm", timeout=0);

sleep(1000)
writeOutput("Running afterStop.cfm<br>")
cfhttp(url="http://localhost:#port#/cfml/applicationFramework/applicationStop/testApp/afterStop.cfm", timeout=0);
</cfscript>
