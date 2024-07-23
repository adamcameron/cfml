<cfscript>
	votedBugs = deserializeJson(fileRead(expandPath("./notFixedBugsWithVotesColumnPopulated.json")), false);
	baseBugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";
</cfscript>
<cfquery dbtype="query" name="votedBugs">
	SELECT		AD_S_DEFECT_ID AS id, AD_S_STATUS AS status, AD_S_REASON AS reason, AD_S_TITLE AS title, AD_S_CREATED_DT AS created, version AS version, votes AS votes
	FROM		votedBugs
	WHERE		votes >= 10
	ORDER BY	votes DESC
</cfquery>

<cfprocessingdirective suppresswhitespace="true">

<style>
	td {
		white-space	: nowrap;
	}
</style>
<table border="1">
	<thead>
		<tr><th>ID</th><th>Votes</th><th>Version</th><th>Status</th><th>Created</th><th>Title</th></tr>
	</thead>
	<tbody>
		<cfloop query="votedBugs">
			<cfset bugUrl = baseBugUrl & id>
			<tr>
				<cfoutput>
					<td><a href="#bugUrl#">#id#</a></td>
					<td>#votes#</td>
					<td>#version#</td>
					<td>#status#/#reason#</td>
					<td>#dateFormat(created, "yyyy-mm-dd")#</td>
					<td><a href="#bugUrl#">#title#</a></td>
				</cfoutput>
			</tr>
		</cfloop>
	</tbody>
</table>

</cfprocessingdirective>