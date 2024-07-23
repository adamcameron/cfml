<cfset bugsJson = fileRead(expandPath("./cf10BugsUnverified.json"))>
<cfset bugs = deserializeJson(bugsJson, false)>
<cfquery name="bugs" dbtype="query">
	SELECT		ad_s_created_dt AS created, ad_s_defect_id AS id, ad_s_title AS summary
	FROM		bugs.query
	ORDER BY	ad_s_defect_id
</cfquery>
<cfset baseBugUrl="https://bugbase.adobe.com/index.cfm?event=bug&id=">
<cfoutput>
<table border="1" id="bugs">
<thead>
	<tr><th>##<th>Created</th><th>ID</th><th>Summary</th></tr>
</thead>
<tbody>
<cfloop query="bugs">
	<cfset thisBugUrl=baseBugUrl & id>
	<tr><td>#currentRow#<td>#dateFormat(created, "yyyy-mm-dd")#</td><td><a href="#thisBugUrl#" target="_blank">#id#</a></td><td><a href="#thisBugUrl#" target="_blank">#summary#</a></td></tr>
</cfloop>
</tbody>
</table>
</cfoutput>

