<cfscript>
	public boolean function onApplicationStart() {
		writeToLog("Top of onApplicationStart")

		executeSlowDbOperation()

		if (URL?.throwError == true) {
			writeToLog("Throwing an error")
			throw("Throwing an error")
		}

		writeToLog("Bottom of onApplicationStart")

		return true
	}

	public boolean function onRequestStart(required string targetPage) {
		writeToLog("Top of onRequestStart")

		executeSlowDbOperation()

		writeToLog("Middle of onRequestStart")

		executeSlowDbOperation()

		writeToLog("Bottom of onRequestStart")

		return true
	}

	public void function onRequest(required string targetPage) {
		writeToLog("Top of onRequest")

		executeSlowDbOperation()

		include targetPage;

		writeToLog("Bottom of onRequest")
	}

	public void function _onError(required struct exception) {
		writeToLog("Top of onError")
		throw(object=exception)
	}
</cfscript>
