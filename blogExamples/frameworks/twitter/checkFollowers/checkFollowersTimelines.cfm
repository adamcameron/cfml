<cfflush interval="16">
<cfscript>
	// checkfollowedUsersTimelines.cfm

	maxStatusHistorySize = 500;
	earliestStatusDate = dateAdd("m", -6, now());

	followedUsers = application.twitterService.getFriendsIDs(screen_name="daccfml");

	CRLF = chr(13) & chr(10);

	processedUsersFilePath = getDirectoryFromPath(getCurrentTemplatePath()) & "processedUsers.dat";
	if (fileExists(processedUsersFilePath)){
		processedUsers = fileRead(processedUsersFilePath);
	}else{
		processedUsers = "";
		fileWrite(processedUsersFilePath, "");
	}
	processedUsersFile = fileOpen(processedUsersFilePath, "append");


	for (followedUser in followedUsers.ids){
		if (listFind(processedUsers, followedUser, CRLF)){
			writeOutput("#followedUser# already known-good. Skipping<br>");
			continue;
		}

		structDelete(variables, "minId"); // we track this for each user
		processedStatusCount = 0;

		details = application.twitterService.getUserDetails(user_id=followedUser);

		if (structKeyExists(details, "errors")){
			writeOutput("Error returned from Twitter whilst getting details for user #followedUser#<br>");
			writeDump(var=details);
			writeOutput("Processing aborted<br>");
			abort;
		}
		writeOutput("<h3>Processing user #details.name# (#details.id# / #details.screen_name#)</h3>");

		max_id = "";
		while (true){
			userProcessingComplete = false;
			writeOutput("Processing from max_id = [#max_id#]<br>");

			timeline = getTimeline(details.id, max_id);

			if (!(isArray(timeline) && arrayLen(timeline))){
				writeOutput("No results returned<br>");
				break;
			}

			for (entry in timeline){
				if (!checkThresholds()){
					userProcessingComplete = true;
					break;
				}

				param minId=entry.id;
				minId = min(minId, entry.id);
				writeOutput("Processing status: #entry.id# #dateFormat(createdAt, 'yyyy-mm-dd')# #entry.text#<br>");

				if (validateMessageContent(entry.text)){
					writeOutput('<span style="color:green">Valid content found in [#entry.text#]</span><br>');
					userProcessingComplete = true;
					fileWriteLine(processedUsersFile, details.id);
					break;
				}
			}
			if (userProcessingComplete){
				break;
			}
			// if we got to the end, get another page
			max_id = precisionEvaluate(minId-1);
		}
		writeOutput("Finished processing user<hr>");
		sleep(5000);	// was getting some connection failures. This is an attempt to mitigate
	}

	fileClose(processedUsersFile);



	date function parseTwitterDate(string twitterDate){
		// Sat Nov 30 14:04:02 +0000 2013
		var yyyy	= right(twitterDate, 4);
		var mmm 	= mid(twitterDate, 5, 4);
		var dd		= mid(twitterDate, 9, 2);
		return parseDateTime("#dd# #mmm# #yyyy#");
	}

	boolean function validateMessageContent(string text){
		return reFindNoCase("\b(?:coldfusion|cf\w+|railo)\b", text);
	}

	boolean function checkThresholds(){
		if (++processedStatusCount >= maxStatusHistorySize){
			writeOutput('<span style="color:red">Maximum number of messages to process for user reached</span><br>');
			return false;
		};
		createdAt = parseTwitterDate(entry.created_at);
		if (dateCompare(createdAt, earliestStatusDate, "d") < 0){
			writeOutput('<span style="color:red">Earliest date to check reached (status date: #dateFormat(createdAt, 'yyyy-mm-dd')#; earliest allowable: #dateFormat(earliestStatusDate, 'yyyy-mm-dd')#)</span><br>');
			return false;
		}
		return true;
	}

	array function getTimeline(id, max_id){
		try {
			var timeline = application.twitterService.getUserTimeline(
				user_id			= id,
				count			= 200,
				max_id			= max_id,
				exclude_replies	= true
			);
			if (!isArray(timeline)){
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

</cfscript>