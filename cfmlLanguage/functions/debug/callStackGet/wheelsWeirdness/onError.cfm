<cfscript>
	function onError(exception, eventName) {
		writeLog(file="wheelsWeirdness01", text="onError start")
		writeDump(arguments)
		writeDump(callStackGet())
		throw "thrown in onError";
	}
</cfscript>
