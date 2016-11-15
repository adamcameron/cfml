<cfscript>
cfcontent(type="application/json");

writeLog(file="testApp", text="[ID: #URL.id#] request received");

sleep(5000);

writeOutput(serializeJson({"id"=URL.id, "retrieved"=now().dateTimeFormat("HH:nn:ss.lll")}));
writeLog(file="testApp", text="[ID: #URL.id#] response returned");
</cfscript>