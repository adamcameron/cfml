<cfscript>
// loadBugDetail.cfm
cfflush(interval=16);
include "udfs.cfm";

bugUrl = "https://bugbase.adobe.com/index.cfm?event=bug&id=";

bugDetails = fileRead(expandPath("./testIds.txt")).listToArray(chr(13)).map(function(bugId){
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
bugData = serializeJson(bugDetails);
fileWrite(expandPath("./bug.json"), bugData);
writeDump(bugDetails);
</cfscript>