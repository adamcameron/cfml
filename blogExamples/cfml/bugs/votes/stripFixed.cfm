<cfset allVotedBugs = deserializeJson(fileRead(expandPath("./allVotedBugs.json")), false)>
<cfquery name="notFixedBugs" dbtype="query">
	SELECT	*
	FROM	allVotedBugs
	WHERE	AD_S_STATUS != 'Fixed'
</cfquery>
<cfset fileWrite(expandPath("./notFixedBugs.json"), serializeJson(notFixedBugs, true))>