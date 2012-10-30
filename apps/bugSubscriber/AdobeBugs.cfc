component {

	// magic data
	variables.bugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	variables.search		= {
		pagesize	= 50,
		Fields		=  [
			"REPORTEDBY",
			"TITLE",
			"DESCRIPTION",
			"TESTCONFIG"
		]
	};
	variables.product		= {
		coldfusion	= 1149,
		versions	= {
			"10.0.0"	= 7770,
			"9.0.1"		= 9288,
			"9.0.0"		= 9289,
			"8.0.1"		= 9290,
			"8.0.0"		= 9291
		}
	};

	variables.search.url	= "https://bugbase.adobe.com/index.cfm"
							& "?event=qSearchBugs"
							& "&page=1&pageSize=#variables.search.pagesize#"
							& "&gridsortcolumn=AD_S_DEFECT_ID&gridsortdirection=DESC"
							& "&product=#variables.product.coldfusion#"
	;

	public AdobeBugs function init(){
		return this;
	}

	public query function search(required string criteria){
		var adobeResult 	= "";
		var allResults		= queryNew("id,title,created,status,reason,version");
		var currentResult	= queryNew("id,title,created,status,reason,version");
		var version			= "";
		var keyword			= "";
		var searchUrl		= "";
		var selectCols		= "cast(id AS varchar) AS id, cast(title AS varchar) AS title, cast(created AS varchar) AS created, cast(status AS varchar) AS status, cast(reason AS varchar) AS reason, cast(version AS varchar) AS version";

		if (reFind("^\d{7}$", criteria)){
			// it's likely to be an ID, so just try to get the exact bug first
			adobeResult		= makeRequest(variables.bugUrl & criteria);
			allResults		= htmlToQuery(adobeResult);
		}

		// but look for other matches too
		for (version in variables.product.versions){
			for (field in variables.search.fields){
				searchUrl		= variables.search.url & "&version=#variables.product.versions[version]#&#field#=#criteria#";
				adobeResult		= makeRequest(searchUrl);
				currentResult	= jsonToQuery(adobeResult, version);

				// merge this with what we've already got
				allResults = new Query(
					dbtype		= "query",
					sql			= "
						SELECT	#selectCols#
						FROM	allResults
						UNION
						SELECT	#selectCols#
						FROM	currentResult
					",
					allResults		= allResults,
					currentResult	= currentResult
				).execute().getResult();
			}
		}

		// sort 'em
		allResults = new Query(
			dbtype		= "query",
			sql			= "
				SELECT		*
				FROM		allResults
				ORDER BY	id DESC
			",
			allResults		= allResults
		).execute().getResult();

		return allResults;
	}

	private string function makeRequest(required string URL){
		var response		= false;
		var responseBody	= "";
		var httpService = new http(
			method	= "get",
			url		= arguments.URL
		);
		var response = httpService.send().getPrefix();
		if (response.statusCode == "200 OK"){
			responseBody = response.fileContent;
		}
		return responseBody;
	}


	private query function jsonToQuery(json, version){
		var responseData	= reReplace(json, "^//", "", "ONE");
		var bugData			= "";
		var bugQuery		= queryNew("id,status,reason,title,created,version");
		var row				= 0;

		if (!isJson(responseData)){
			return bugQuery;
		}
		bugData = deserializeJson(responseData);

		for (row=1; row <= arrayLen(bugData.query.data); row++){
			queryAddRow(bugQuery);
			querySetCell(bugQuery, "id", bugData.query.data[row][1]);
			querySetCell(bugQuery, "status", bugData.query.data[row][2]);
			querySetCell(bugQuery, "reason", bugData.query.data[row][3]);
			querySetCell(bugQuery, "title", bugData.query.data[row][4]);
			querySetCell(bugQuery, "created", bugData.query.data[row][5]);
			querySetCell(bugQuery, "version", version);
		}
		return bugQuery;

	}


	private query function htmlToQuery(html){
		// we've got a bug page (or a "bug not found page")
		var result	= queryNew("id,title,created,status,reason,version");
		var match	= reFind("<title>Bug##(\d{7})", html, 1, true);
		var status	= "-";
		var reason	= "-";
		var created	= "";
		if (arrayLen(match.pos) == 2){
			queryAddRow(result);
			querySetCell(result, "id", mid(html, match.pos[2], match.len[2]));

			match = reFindNoCase("<title>Bug##\d{7}\s*-\s*(.*?)</title>", html, 1, true);
			if (arrayLen(match.pos) == 2){
				title = mid(html, match.pos[2], match.len[2]);
			}
			querySetCell(result, "title", title);

			match = reFindNoCase('<div class="actions">\s*Created on \w+, (\w+\s+\d+,\s+\d+)\s*</div>', html, 1, true);
			if (arrayLen(match.pos) == 2){
				created = mid(html, match.pos[2], match.len[2]);
				try {
					// still no guarantee that it'll work as a date
					created = parsedateTime(created);
				}
				catch (any e){
					created	= "";
				}
			}
			querySetCell(result, "created", created);

			match = reFindNoCase("<b>State</b>\s*(\w+).*?<b>Status</b>\s*(\w+)", html, 1, true);
			if (arrayLen(match.pos) == 3){
				status = mid(html, match.pos[2], match.len[2]) & "/" & mid(html, match.pos[3], match.len[3]);
			}
			querySetCell(result, "status", status);

			match = reFindNoCase("<b>Reason</b>\s*(\w+)", html, 1, true);
			if (arrayLen(match.pos) == 2){
				reason = mid(html, match.pos[2], match.len[2]);
			}
			querySetCell(result, "reason", reason);

			match = reFindNoCase('<h1 class="title">\s*ColdFusion\s*([\d.]+)', html, 1, true);
			if (arrayLen(match.pos) == 2){
				version = mid(html, match.pos[2], match.len[2]);
			}
			querySetCell(result, "version", version);
		}
		return result;
	}

}