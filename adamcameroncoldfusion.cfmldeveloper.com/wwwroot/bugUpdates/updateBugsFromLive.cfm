<cfflush interval="16">
<cfset bugsFromLive = deserializeJson(fileRead(expandPath("./bugsDumped20130929.json")))>
<cfloop index="row" from="1" to="#arrayLen(bugsFromLive.data.adobeId)#">

<cfquery>
	INSERT INTO adobeBug (
		#arrayToList(bugsFromLive.columns)#
	) VALUES (
		<cfqueryparam value="#bugsFromLive.data.adobeId[row]#" cfsqltype="CF_SQL_INTEGER">,
		<cfqueryparam value="#bugsFromLive.data.version[row]#" cfsqltype="CF_SQL_VARCHAR">,
		<cfqueryparam value="#bugsFromLive.data.title[row]#" cfsqltype="CF_SQL_VARCHAR">,
		<cfqueryparam value="#bugsFromLive.data.status[row]#" cfsqltype="CF_SQL_VARCHAR">,
		<cfqueryparam value="#bugsFromLive.data.state[row]#" cfsqltype="CF_SQL_VARCHAR">,
		<cfqueryparam value="#bugsFromLive.data.comments[row]#" cfsqltype="CF_SQL_INTEGER">,
		<cfqueryparam value="#bugsFromLive.data.attachments[row]#" cfsqltype="CF_SQL_INTEGER">,
		<cfqueryparam value="#bugsFromLive.data.votes[row]#" cfsqltype="CF_SQL_INTEGER">
	)
</cfquery>
<cfoutput>Inserted #bugsFromLive.data.adobeId[row]#: #bugsFromLive.data.title[row]#<br></cfoutput>
</cfloop>
