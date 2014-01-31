<cfscript>
// getMessages.cfm
include "../udfs.cfm";

messagesFilePath = getDirectoryFromPath(getCurrentTemplatePath()) & "messages.dat";
messagesFile = fileOpen(messagesFilePath, "append");

maxStatusHistorySize	= 5000;
earliestStatusDate		= dateAdd("m", -12, now());
processedStatusCount	= 0;

max_id = "";

processingCompleted = false;
while (true){
	writeOutput("Processing from max_id = [#max_id#]<br>");

	timeline = getTimeline("cfmlNotifier", max_id);

	if (!arrayLen(timeline)){
		writeOutput("No results returned<br>");
		break;
	}

	for (entry in timeline){
		if (!checkThresholds()){
			processingCompleted = true;
			break;
		}

		param minId=entry.id;
		minId = min(minId, entry.id);
		writeOutput("Processing status: #entry.id# #dateFormat(createdAt, 'yyyy-mm-dd')# #entry.text#<br>");

		if (validateMessageContent(entry.text)){
			writeOutput('<span style="color:green">Valid content found in [#entry.text#]</span><br>');
			fileWriteLine(messagesFile, "#parseTwitterDate(entry.created_at)#: #entry.text#");
		}
	}
	if (processingCompleted){
		break;
	}
	max_id = precisionEvaluate(minId-1);
}
fileClose(messagesFile);



boolean function validateMessageContent(string text){
	return reFindNoCase("\bUntriaged ColdFusion\b", text);
}

</cfscript>