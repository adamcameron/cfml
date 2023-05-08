<cfflush interval="16">
<cfset notFixedBugs = deserializeJson(fileRead(expandPath("./notFixedBugs.json")), false)>
<cfset queryAddColumn(notFixedBugs, "votes", "integer", listToArray(repeatString("0,", notFixedBugs.recordCount)))>
<cfset fileWrite(expandPath("./notFixedBugsWithVotesColumn.json"), serializeJson(notFixedBugs, true))>
