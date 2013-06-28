<cfinclude template="./createRecords.cfm">

<cfdump var="#getMetadata(records)#" label="getMetadata(records)">
<br>
<cfdump var="#getMetadata(deserialisedRecords)#" label="getMetadata(deserialisedRecords)">
<br>
<cfdump var="#getMetadata(deserializeJson(json, false))#" label="getMetadata(deserializeJson(json, false))">