<cfscript>
noLeadingZero = .0006;
withLeadingZero = 0.0006;
struct = {noLeadingZero=noLeadingZero, withLeadingZero=withLeadingZero};
json = serializeJSON(struct);
deserialised = deserializeJson(json);
writeDump([
	{struct=struct},
	{json=json},
	{deserialised=deserialised}
]);
</cfscript>