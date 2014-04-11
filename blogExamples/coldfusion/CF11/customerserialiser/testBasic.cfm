<cfscript>
	o = new Basic();

	serialised = serializeJson(o);
	writeDump([serialised]);

	deserialised = deserializeJson(serialised);
	writeDump([deserialised]);
</cfscript>