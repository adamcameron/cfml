<cfscript>
	struct = {
		inlineUnquoted = "key case is preserved",
		"inlineQuoted" = "key case is preserved" 
	};
	struct.doNotation = "key is uppercase";
	struct["arrayNotation"] = "key case is preserved";
	writeDump(struct);
</cfscript>