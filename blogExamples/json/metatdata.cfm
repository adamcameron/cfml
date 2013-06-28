<cfinclude template="./createRecords.cfm">

<cfdump var="#getMetadata(records)#" label="getMetadata(records)">
<br>
<cfdump var="#getMetadata(deserialisedRecords)#" label="getMetadata(deserialisedRecords)">