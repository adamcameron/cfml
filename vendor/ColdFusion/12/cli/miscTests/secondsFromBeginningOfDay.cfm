<cfscript>
function secondsFromBeginningOfDay(){
	var snapshotOfNow = now();
	var beginningOfDay = createDate(year(snapshotOfNow), month(snapshotOfNow), day(snapshotOfNow));
	var seconds = dateDiff("s", beginningOfDay, snapshotOfNow);
	return seconds;
}

writeOutput(secondsFromBeginningOfDay());

writeOutput(chr(13));
</cfscript>