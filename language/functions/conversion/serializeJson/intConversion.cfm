<cfscript>

	st = {
		positive 	= 5,
		zero		= 0,
		negative	= -5
	};
	s = serializeJson(st);
	writeOutput(s);
</cfscript>