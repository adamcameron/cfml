<cfinclude template="./createRecords.cfm">

<cfdump var="#getMetadata(records)#" label="getMetadata(records)">
<br>
<cfdump var="#getMetadata(deserialisedRecords)#" label="getMetadata(deserialisedRecords)">
<br>
<cfdump var="#getMetadata(deserializeJson(records))#" label="getMetadata(deserializeJson(records))">