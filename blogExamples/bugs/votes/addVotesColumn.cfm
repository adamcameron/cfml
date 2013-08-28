<cfflush interval="16">
<cfset allBugs = deserializeJson(fileRead(expandPath("./allBugs.json")), false)>
<cfquery name="filtered" dbtype="query">
	SELECT	*
	FROM	allBugs
	WHERE	AD_S_STATUS <> 'Fixed'
</cfquery>
<cfset queryAddColumn(filtered, "votes", "integer", listToArray(repeatString("0,", filtered.recordCount)))>
<cfset fileWrite(expandPath("./filteredBugs.json"), serializeJson(filtered, true))>
