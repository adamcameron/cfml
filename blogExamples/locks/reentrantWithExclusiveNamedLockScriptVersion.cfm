<cfflush interval="1">
<cfscript>
writeOutput("Before read-only named lock<br>");
lock name="myLock" type="readonly" timeout=1 {
	writeOutput("Within read-only named lock<br>");
	writeOutput("Before exclusive named lock<br>");
	lock name="myLock" type="exclusive" timeout=1 {
		writeOutput("Within exclusive named lock<br>");
	}
	writeOutput("After exclusive named lock<br>");
}
writeOutput("After read-only named lock<br>");
writeOutput("END<br>");
</cfscript>
