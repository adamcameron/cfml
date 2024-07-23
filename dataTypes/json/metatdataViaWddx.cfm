<cfinclude template="./createRecords.cfm">

<cfwddx action="cfml2wddx" input="#records#" output="wddx">
<cfwddx action="wddx2cfml" input="#wddx#" output="deserialisedRecords">

<cfdump var="#[
records,
getMetadata(records),
wddx,
deserialisedRecords,
getMetadata(deserialisedRecords)
]#">
