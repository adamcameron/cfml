<cfscript>
param integer URL.id;
writeLog(file="testApp", text="[ID: #URL.id#] request received");

sleep(1000);

writeOutput(serializeJson({"id"=URL.id, "retrieved"=now().dateTimeFormat("yyyy-mm-d HH:nn:ss.lll")}));
writeLog(file="testApp", text="[ID: #URL.id#] response returned");
</cfscript>
