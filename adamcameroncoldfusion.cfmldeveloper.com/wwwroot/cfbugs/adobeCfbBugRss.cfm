<cfsetting showdebugoutput="false">
<cfcontent type="application/rss+xml">
<cfif structKeyExists(application, "feeds") AND structKeyExists(application.feeds, "cfb") AND dateDiff("m", application.feeds.cfb.timestamp, now()) LE 180>
	<cfcontent reset="true"><cfoutput>#application.feeds.cfb.xml#</cfoutput><cfexit>
</cfif>
<cfsilent>
<cfscript>
// relevant
	product		= 1958;
	versions	= {
		"2.0.1"		= 8972,
		"2.0"		= 8104,
		"1.0"		= 8103
	};
	bugsUrl		= "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=50&product=#product#&version={VERSION}&gridsortcolumn=AD_S_DEFECT_ID&gridsortdirection=DESC";
	bugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	bugs = queryNew("DEFID,AD_S_STATUS,AD_S_REASON,AD_S_TITLE,AD_S_CREATED_DT,version");

	for (version in versions){
		thisVersionUrl = replace(bugsUrl, "{VERSION}", versions[version], "ONE");
		httpService = new http(
			method	= "get",
			url		= thisVersionUrl
		);
		response = httpService.send().getPrefix();
		if (response.statusCode == "200 OK"){
			responseData = reReplace(response.fileContent, "^//", "", "ONE");
			bugData = deserializeJson(responseData);
			bugQuery = queryNew("DEFID,AD_S_STATUS,AD_S_REASON,AD_S_TITLE,AD_S_CREATED_DT,version");
			try {
				for (row=1; row <= arrayLen(bugData.query.data); row++){
					queryAddRow(bugQuery);
					querySetCell(bugQuery, "DEFID", bugData.query.data[row][2]);
					querySetCell(bugQuery, "AD_S_STATUS", bugData.query.data[row][3]);
					querySetCell(bugQuery, "AD_S_REASON", bugData.query.data[row][4]);
					querySetCell(bugQuery, "AD_S_TITLE", bugData.query.data[row][5]);
					querySetCell(bugQuery, "AD_S_CREATED_DT", bugData.query.data[row][6]);
					querySetCell(bugQuery, "version", version);
				}
				bugs = new Query(
					dbtype		= "query",
					sql			= "
						SELECT	cast(DEFID AS varchar) AS DEFID, cast(AD_S_STATUS AS varchar) AS AD_S_STATUS, cast(AD_S_REASON AS varchar) AS AD_S_REASON, cast(AD_S_TITLE AS varchar) AS AD_S_TITLE, cast(AD_S_CREATED_DT AS varchar) AS AD_S_CREATED_DT, cast(version AS varchar) AS version
						FROM	bugs
						UNION
						SELECT	cast(DEFID AS varchar) AS DEFID, cast(AD_S_STATUS AS varchar) AS AD_S_STATUS, cast(AD_S_REASON AS varchar) AS AD_S_REASON, cast(AD_S_TITLE AS varchar) AS AD_S_TITLE, cast(AD_S_CREATED_DT AS varchar) AS AD_S_CREATED_DT, cast(version AS varchar) AS version
						FROM	bugQuery
					",
					bugs		= bugs,
					bugQuery	= bugQuery
				).execute().getResult();
			}
			catch (any e){
				writeDump(e);
				writeDump(variables);
				abort;
			}
		}
	}

	bugs = new Query(
		dbtype	= "query",
		sql		= "
			SELECT		CAST(CAST(DEFID AS INTEGER) AS VARCHAR) + ': ' +  AD_S_TITLE + ' (v' + version + ')'	AS title,
						AD_S_CREATED_DT												AS publishedDate,
						CAST(CAST(DEFID AS INTEGER) AS VARCHAR) + ': ' +  AD_S_TITLE + ' (v' + version + '); Status: ' + AD_S_STATUS + '; Reason: ' + AD_S_REASON		AS content,
						'#bugUrl#' + CAST(CAST(DEFID AS INTEGER) AS VARCHAR)		AS rssLink
			FROM		bugs
			ORDER BY	DEFID DESC
		",
		maxrows	= 50,
		bugs	= bugs
	).execute().getResult();

	feed xmlvar="feedXml" action="create" query=bugs properties={
		title		= "50 most-recent ColdFusion Builder Bugs",
		link		= "http://adamcameroncoldfusion.cfmldeveloper.com/cfbugs/adobeCfbBugRss.cfm",
		description	= "This lists the 50 most recent bugs raised for ColdFusion Builder from the Adobe bug tracker @ https://bugbase.adobe.com",
		version 	= "rss_2.0"
	};

	application.feeds.cfb = {
		xml = trim(feedXml),
		timestamp = now()
	};
</cfscript>
</cfsilent><cfcontent reset="true"><cfoutput>#application.feeds.cfb.xml#</cfoutput>