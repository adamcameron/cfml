component {


	variables.product		= 1149;
	variables.versions	= {
		"10.0.0"	= 7770,
		"9.0.1"		= 9288,
		"9.0.0"		= 9289,
		"8.0.1"		= 9290,
		"8.0.0"		= 9291
	};
	variables.bugsUrl		= "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=1000&product={PRODUCT}&version={VERSION}&state=OPEN";
	variables.bugUrl		= "https://bugbase.adobe.com/index.cfm?event=bug&id=";

	variables.patterns	= {
		notfound	= "<title>The information requested is not found</title>",
		version		= '<h1 class="title">\s*ColdFusion\s*(\S+)',
		title		= "<h2>Title</h2>\s*<p>(.*?)</p>",
		status 		= "<h3>status</h3>\s*<div[^>]+>\s+<b>state</b>(.*?)</div>\s*<div[^>]+>\s+<b>status</b>(.*?)</div>\s*<div[^>]+>\s+<b>reason</b>(.*?)</div>",
		comments	= '<div id="comment">.*?Notes\s+\((\d+)\).*?</div>',
		attachments	= "<h3>Attachments\s+\((\d+)\)</h3>",
		votes		= '<div id="votes">.*?Votes\s+\((\d+)\).*?</div>'
	};


	public query function getBugs(){
		var allBugs = queryNew("AD_S_DEFECT_ID,AD_S_STATUS,AD_S_REASON,AD_S_TITLE,AD_S_CREATED_DT,version");

		for (var version in variables.versions){
			var thisVersionUrl = replace(variables.bugsUrl, "{VERSION}", versions[version], "ONE");
			thisVersionUrl = replace(thisVersionUrl, "{PRODUCT}", variables.product, "ONE");

			var httpService = new http(
				method	= "get",
				url		= thisVersionUrl
			);
			var response = httpService.send().getPrefix();
			if (response.statusCode == "200 OK"){
				var responseData = reReplace(response.fileContent, "^//", "", "ONE");
				var bugsForThisVersion = deserializeJson(responseData, false).query;

				allBugs = new Query(
					dbtype				= "query",
					sql					= "
						SELECT		cast(AD_S_DEFECT_ID AS varchar) AS AD_S_DEFECT_ID, cast(AD_S_STATUS AS varchar) AS AD_S_STATUS, cast(AD_S_REASON AS varchar) AS AD_S_REASON, cast(AD_S_TITLE AS varchar) AS AD_S_TITLE, cast(AD_S_CREATED_DT AS varchar) AS AD_S_CREATED_DT, cast(version AS varchar) AS version
						FROM		allBugs
						UNION
						SELECT		cast(AD_S_DEFECT_ID AS varchar) AS AD_S_DEFECT_ID, cast(AD_S_STATUS AS varchar) AS AD_S_STATUS, cast(AD_S_REASON AS varchar) AS AD_S_REASON, cast(AD_S_TITLE AS varchar) AS AD_S_TITLE, cast(AD_S_CREATED_DT AS varchar) AS AD_S_CREATED_DT, cast('#version#' AS varchar) AS version
						FROM		bugsForThisVersion
						ORDER BY	AD_S_DEFECT_ID
					",
					allBugs				= allBugs,
					bugsForThisVersion	= bugsForThisVersion
				).execute().getResult();
			}
		}

		return allBugs;
	}


	public struct function getBug(required numeric adobeId){
		var thisBugUrl = variables.bugUrl & adobeId;
		var httpService = new http(
			method	= "get",
			url		= thisBugUrl
		);
		var response = httpService.send().getPrefix();

		// there's a coupla error conditions: HTTP errors, or a bung bug ID. Deal...
		if (response.statusCode != "200 OK"){
			throw(message="Request failed", type="RequestFailedException", detail="The request to #thisBugUrl# returned #response.statusCode#", errorcode=val(response.statusCode));
		}

		var bugHtml = response.fileContent;
		if (reFindNoCase(variables.patterns.notfound, bugHtml)){
			throw(message="Bug not found", type="BugNotFoundException", detail="Could not find bug ID #adobeId# in the Adobe bug base");
		}

		// OK, we have the bug's mark-up. Find the bits 'n' pieces we want
		var bugDetails = {
			title		= "",
			version		= "",
			status		= "",
			state		= "",
			comments	= 0,
			attachments	= 0,
			votes		= 0
		};

		var match = reFindNoCase(variables.patterns.title, bugHtml, 1, true);
		if (arrayLen(match.pos) >= 2){
			bugDetails.title = trim(mid(bugHtml, match.pos[2], match.len[2]));
		}else{
			bugDetails.title = "";
		}


		match = reFindNoCase(variables.patterns.version, bugHtml, 1, true);
		if (arrayLen(match.pos) >= 2){
			bugDetails.version = trim(mid(bugHtml, match.pos[2], match.len[2]));
		}else{
			bugDetails.version = "";
		}

		match = reFindNoCase(variables.patterns.status, bugHtml, 1, true);
		if (arrayLen(match.pos) >= 2){
			bugDetails.status = trim(mid(bugHtml, match.pos[2], match.len[2]));
		}else{
			bugDetails.status = "";
		}
		if (arrayLen(match.pos) >= 3){
			bugDetails.state = trim(mid(bugHtml, match.pos[3], match.len[3]));
		}else{
			bugDetails.state = "";
		}

		match = reFindNoCase(variables.patterns.comments, bugHtml, 1, true);
		if (arrayLen(match.pos) >= 2){
			bugDetails.comments = trim(mid(bugHtml, match.pos[2], match.len[2]));
		}else{
			bugDetails.comments = 0;
		}

		match = reFindNoCase(variables.patterns.attachments, bugHtml, 1, true);
		if (arrayLen(match.pos) >= 2){
			bugDetails.attachments = trim(mid(bugHtml, match.pos[2], match.len[2]));
		}else{
			bugDetails.attachments = 0;
		}

		match = reFindNoCase(variables.patterns.votes, bugHtml, 1, true);
		if (arrayLen(match.pos) >= 2){
			bugDetails.votes = trim(mid(bugHtml, match.pos[2], match.len[2]));
		}else{
			bugDetails.votes = 0;
		}

		return bugDetails;
	}

	public string function getBugUrl(required numeric adobeId){
		return variables.bugUrl & adobeId;
	}

}