<cfscript>
	st = {
		someLocalVar = stuff.C::SOME_STATIC_VAR,
		someOtherLocalVar = stuff.C::SOME_OTHER_STATIC_VAR
	}

	writeDump(st)
	</cfscript>
