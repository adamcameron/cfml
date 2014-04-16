<cfsetting showdebugoutput="false">
<cfscript>
	cfVersions = [9288,9289];

	bugsUrlTemplate = "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=500&type=Bugs&product=1149&version={VERSION}&state=OPEN&status=UNVR";
	bugUrl	= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	for (cfVersion in cfVersions){
		bugsUrl = replaceNoCase(bugsUrlTemplate, "{version}", cfVersion, "ONE");
		httpConnection = new Http(URL=bugsUrl, method="get");
		bugsJsonP = httpConnection.send().getPrefix().fileContent;
		bugsJson = removeChars(bugsJsonP, 1, 2);
		if (!isJson(bugsJson)){
			writeOutput("Error fetching data: response from server was not expected JSON");
			writeDump([bugsUrl,bugsJsonP]);
			exit;
		}
		bugs = deserializeJson(bugsJson, false).query;
		param query allBugs = queryNew(bugs.columnList);
		param string typedColumnList = reReplace(allBugs.columnList, "(\w+)" ,"CAST(\1 AS VARCHAR) AS \1", "ALL");
		allBugs = new Query(allBugs=allBugs, bugs=bugs, dbtype="query", sql="SELECT #typedColumnList# FROM allBugs UNION ALL SELECT #typedColumnList# FROM bugs").execute().getResult();
	}
</cfscript>
<cfquery name="bugsSorted" dbtype="query">
	SELECT		defid AS id, ad_s_created_dt AS dateCreated, ad_s_title AS summary
	FROM		allBugs
	ORDER BY	defid
</cfquery>
<cfoutput>
<style>
	td {
		white-space	: nowrap;
	}
</style>
<table border="1">
	<thead>
		<tr><th>##</th><th>Created</th><th>ID</th><th>Summary</th></tr>
	</thead>
	<tbody>
		<cfloop query="bugsSorted">
			<tr>
				<td>#currentRow#</td>
				<td>#dateFormat(dateCreated, "yyyy-mm-dd")#</td>
				<td><a href="#bugUrl##id#" target="_blank">#id#</a></td>
				<td><a href="#bugUrl##id#" target="_blank">#summary#</a></td>
			</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>