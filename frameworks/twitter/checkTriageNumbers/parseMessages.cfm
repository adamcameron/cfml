<cfscript>
	messageFile = fileOpen(expandPath("./messages.dat"), "read");

	lengthOfDate = len("{ts 'YYYY-MM-DD HH:NN:SS'}");

	results = {};
	while (!fileIsEof(messageFile)){
		line = fileReadLine(messageFile);
		writeOutput(line & "<br>");
		countMatch = reFindNoCase("^.*bug count: (\d+).*$", line, 1, true);
		if (arrayLen(countMatch.pos) < 2){
			continue;
		}
		count = mid(line, countMatch.pos[2], countMatch.len[2]);

		versionMatch = reFindNoCase("^.*Untriaged ColdFusion (\S+) bug count.*$", line, 1, true);
		version = mid(line, versionMatch.pos[2], versionMatch.len[2]);

		date = parseDateTime(left(line, lengthOfDate));

		if (!structKeyExists(results, version)){
			results[version] = [];
		}
		arrayPrepend(results[version], {"date"=dateFormat(date, "yyyy-mm-dd"), "count"=count});
	}
	fileClose(messageFile);
	writeDump(var=results);
	fileWrite(expandPath("./bugData.json"), serializeJson(results));
</cfscript>