<cfscript>
	votedBugs = deserializeJson(fileRead(expandPath("./filteredBugs.json")), false);
	writeOutput(votedBugs.columnList);
	// AD_S_CREATED_DT,AD_S_DEFECT_ID,AD_S_REASON,AD_S_STATUS,AD_S_TITLE,VERSION,VOTES
writeDump(votedBugs);
</cfscript>
<cfquery dbtype="query" name="votedBugs">
	SELECT *
	FROM votedBugs
	ORDER BY votes DESC	
</cfquery>

<cfdump var="#votedBugs#">
