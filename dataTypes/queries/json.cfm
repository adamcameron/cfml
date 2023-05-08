<cfscript>
	original = queryNew("");
	queryAddColumn(original, "id", [1,2,3]);
	queryAddColumn(original, "maori", ["mangu", "whero", "ma"]);
	queryAddColumn(original, "english", ["black", "red", "white"]);
	
	json = serializeJSON(original);
	deserialised = deserializeJSON(json, false);
	
	writeDump(variables);
</cfscript>