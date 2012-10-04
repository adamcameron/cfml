<cfcontent type="text/xml">
<cfcache action="cache" stripwhitespace="true" timeout="#createTimespan(0,6,0,0)#">
<cfsilent>
<cfscript>
	product		= 1149;
	versions	= {
		"10.0.0"	= 7770,
		"9.0.1"		= 9288,
		"9.0.0"		= 9289,
		"8.0.1"		= 9290,
		"8.0.0"		= 9291
	};
	bugsUrl		= "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=50&product=#product#&version={VERSION}&gridsortcolumn=AD_S_DEFECT_ID&gridsortdirection=DESC";
	bugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	bugs = queryNew("AD_S_DEFECT_ID,AD_S_STATUS,AD_S_REASON,AD_S_TITLE,AD_S_CREATED_DT,version");

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
			bugQuery = queryNew("AD_S_DEFECT_ID,AD_S_STATUS,AD_S_REASON,AD_S_TITLE,AD_S_CREATED_DT,version");
			try {
				for (row=1; row <= arrayLen(bugData.query.data); row++){
					queryAddRow(bugQuery);
					querySetCell(bugQuery, "AD_S_DEFECT_ID", bugData.query.data[row][1]);
					querySetCell(bugQuery, "AD_S_STATUS", bugData.query.data[row][2]);
					querySetCell(bugQuery, "AD_S_REASON", bugData.query.data[row][3]);
					querySetCell(bugQuery, "AD_S_TITLE", bugData.query.data[row][4]);
					querySetCell(bugQuery, "AD_S_CREATED_DT", bugData.query.data[row][5]);
					querySetCell(bugQuery, "version", version);
				}
				bugs = new Query(
					dbtype		= "query",
					sql			= "
						SELECT	cast(AD_S_DEFECT_ID AS varchar) AS AD_S_DEFECT_ID, cast(AD_S_STATUS AS varchar) AS AD_S_STATUS, cast(AD_S_REASON AS varchar) AS AD_S_REASON, cast(AD_S_TITLE AS varchar) AS AD_S_TITLE, cast(AD_S_CREATED_DT AS varchar) AS AD_S_CREATED_DT, cast(version AS varchar) AS version
						FROM	bugs
						UNION
						SELECT	cast(AD_S_DEFECT_ID AS varchar) AS AD_S_DEFECT_ID, cast(AD_S_STATUS AS varchar) AS AD_S_STATUS, cast(AD_S_REASON AS varchar) AS AD_S_REASON, cast(AD_S_TITLE AS varchar) AS AD_S_TITLE, cast(AD_S_CREATED_DT AS varchar) AS AD_S_CREATED_DT, cast(version AS varchar) AS version
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

	// go 'em all: just filter down to the top 50
	bugs = new Query(
		dbtype	= "query",
		sql		= "
			SELECT		AD_S_DEFECT_ID + ': ' +  AD_S_TITLE + ' (v' + version + ')'	AS title,
						AD_S_CREATED_DT												AS publishedDate,
						AD_S_DEFECT_ID + ': ' +  AD_S_TITLE + ' (v' + version + '); Status: ' + AD_S_STATUS + '; Reason: ' + AD_S_REASON		AS content,
						'#bugUrl#' + AD_S_DEFECT_ID									AS rssLink
			FROM		bugs
			ORDER BY	AD_S_DEFECT_ID DESC
		",
		maxrows	= 50,
		bugs	= bugs
	).execute().getResult();

	// and make a feed
	feed = new Feed(
		action		= "create",
		query		= bugs,
		properties	= {
			title		= "50 most-recent ColdFusion Bugs",
			link		= "http://adamcameroncoldfusion.cfmldeveloper.com/cfbugs/adobeBugRss.cfm",
			description	= "This lists the 50 most recent bugs raised for ColdFusion from the Adobe bug tracker @ https://bugbase.adobe.com",
			version 	= "rss_2.0"
		}
	).create();
</cfscript></cfsilent><cfoutput>#trim(feed)#</cfoutput>
</cfcache>