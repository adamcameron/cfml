<cfscript>
// loadBugDetail.cfm
cfflush(interval=16);
include "udfs.cfm";

bugUrl = "https://bugbase.adobe.com/index.cfm?event=bug&id=";
CRLF = chr(13) & chr(10);

bugDetails = fileRead(expandPath("./bugIds.txt")).listToArray(CRLF).map(function(bugId){
	writeOutput("Processing #bugId#&hellip;");
	try {
		var bug = getBug(bugId);
		writeOutput(bug.title & "<br>");
		return bug;
	}
	catch (BugNotFoundException e){
		return {id=bugId};
	}
});
fileWrite(expandPath("./bug.json"), serializeJson(bugDetails));
writeDump(bugDetails);
</cfscript>