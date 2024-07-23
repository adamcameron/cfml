<cfscript>
st = {
	myLocalVar = stuff.C::SOME_STATIC_VAR,
	myOtherLocalVar = stuff.C::SOME_OTHER_STATIC_VAR
}

writeDump(st)
</cfscript>
