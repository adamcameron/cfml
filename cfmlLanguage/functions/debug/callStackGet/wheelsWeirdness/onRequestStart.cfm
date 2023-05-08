<cfscript>
function onRequestStart() {
	writeLog(file="wheelsWeirdness01", text="onRequestStart start")
	if (URL.keyExists("stop")) {
		writeLog(file="wheelsWeirdness01", text="onRequestStart stop called")
		applicationStop()
		writeLog(file="wheelsWeirdness01", text="onRequestStart application stopped")
		throw "thrown in onRequestStart";
	}
	writeLog(file="wheelsWeirdness01", text="onRequestStart end")
}
</cfscript>
