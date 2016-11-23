<cfscript>
cfcontent(type="application/json");

writeLog(file="testApp", text="[ID: #URL.id#] request received");

sleep(5000);
include "./data.cfm";

record = queryExecute(
	"SELECT id, firstName, lastName FROM people WHERE id = :id",
	{id=URL.id},
	{dbtype="query", query="people", maxrows=1}
);

result = structNew("ordered");
result["id"] = record.id;
result["firstName"] = record.firstName;
result["lastName"] = record.lastName;
result["retrieved"] = now().dateTimeFormat("HH:nn:ss.lll");

writeOutput(serializeJson(result));
writeLog(file="testApp", text="[ID: #URL.id#] response returned");
</cfscript>