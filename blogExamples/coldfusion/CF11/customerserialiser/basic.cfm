<cfscript>
//basic.cfm
serialised = serializeJson({test=true});
deserialised = deserializeJson('{"test":true}');

writeDump([
	{serialised = serialised},
	{deserialised = deserialised}
]);
</cfscript>