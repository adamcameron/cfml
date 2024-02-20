<cfscript>
try {
	try {
		1/0
	} catch (any e) {
		handled = createObject("java", "javax.script.ScriptException").init(e)
		throw(
			object = handled
		)
	}
} catch (javax.script.ScriptException e) {
	try {
	throw(object=e.cause)
	} catch (any e2) {
		writeDump([e2.type, e2])
	}
}
</cfscript>
