<cfscript>
//udfs.cfm

array function getTimeline(id, max_id){
	try {
		var timeline = application.twitterService.getUserTimeline(
			user_id			= id,
			count			= 200,
			max_id			= max_id,
			exclude_replies	= true
		);
		if (isStruct(timeline) && structKeyExists(timeline, "errors")){
			writeOutput("Error returned from Twitter whilst getting timeline for user #details.name# (#details.id#)<br>");
			writeDump(var=timeline);
			writeOutput("Processing aborted<br>");
			abort;
		}
		return timeline;
	}
	catch (any e){	// monkehTweets doesn't validate the returned value before deserialising it, which can cause errors
		return [];
	}
}


boolean function checkThresholds(){
	if (++processedStatusCount >= maxStatusHistorySize){
		writeOutput('<span style="color:red">Maximum number of messages to process reached</span><br>');
		return false;
	};
	createdAt = parseTwitterDate(entry.created_at);
	if (dateCompare(createdAt, earliestStatusDate, "d") < 0){
		writeOutput('<span style="color:red">Earliest date to check reached (status date: #dateFormat(createdAt, 'yyyy-mm-dd')#; earliest allowable: #dateFormat(earliestStatusDate, 'yyyy-mm-dd')#)</span><br>');
		return false;
	}
	return true;
}


date function parseTwitterDate(string twitterDate){
	// Sat Nov 30 14:04:02 +0000 2013
	var yyyy	= right(twitterDate, 4);
	var mmm 	= mid(twitterDate, 5, 4);
	var dd		= mid(twitterDate, 9, 2);
	return parseDateTime("#dd# #mmm# #yyyy#");
}

</cfscript>