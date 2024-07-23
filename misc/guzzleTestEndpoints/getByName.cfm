<cfscript>
cfcontent(type="application/json");

writeLog(file="testApp", text="[firstName: #URL.firstName#][lastName: #URL.lastName#] request received");

sleep(2500);
include "./data.cfm";

record = queryExecute(
	"SELECT id, firstName, lastName FROM people WHERE firstName = :firstName AND lastName = :lastName",
	{firstName=URL.firstName, lastName=URL.lastName},
	{dbtype="query", query="people", maxrows=1}
);

result = structNew("ordered");
result["id"] = record.id;
result["firstName"] = record.firstName;
result["lastName"] = record.lastName;
result["retrieved"] = now().dateTimeFormat("HH:nn:ss.lll");

sleep(2500);

writeOutput(serializeJson(result));
writeLog(file="testApp", text="[firstName: #URL.firstName#][lastName: #URL.lastName#] response returned");
</cfscript>