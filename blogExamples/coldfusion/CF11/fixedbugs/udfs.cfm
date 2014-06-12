<cfscript>
//udfs.cfm

// copied from BugBaseProxy.cfc

variables.patterns	= {
	notfound	= "<title>The information requested is not found</title>",
	version		= '<h1 class="title">\s*ColdFusion\s*(\S+)',
	title		= "<h2>Title</h2>\s*<p>(.*?)</p>",
	status 		= "<h3>status</h3>\s*<div[^>]+>\s+<b>state</b>(.*?)</div>\s*<div[^>]+>\s+<b>status</b>(.*?)</div>\s*<div[^>]+>\s+<b>reason</b>(.*?)</div>",
	comments	= '<div id="comment">.*?Notes\s+\((\d+)\).*?</div>',
	attachments	= "<h3>Attachments\s+\((\d+)\)</h3>",
	votes		= '<div id="votes">.*?Votes\s+\((\d+)\).*?</div>'
};

public struct function getBug(required numeric adobeId){
	var thisBugUrl = variables.bugUrl & adobeId;
	var httpService = new http(
		method		= "get",
		url			= thisBugUrl,
		useragent	= createUuid()
	);
	var response = httpService.send().getPrefix();

	// there's a coupla error conditions: HTTP errors, or a bung bug ID. Deal...
	if (response.statusCode != "200 OK"){
		throw(message="Request failed", type="RequestFailedException", detail="The request to #thisBugUrl# returned #response.statusCode#", errorcode=val(response.statusCode));
	}

	var bugHtml = response.fileContent;
	// OK, we have the bug's mark-up. Find the bits 'n' pieces we want
	var bugDetails = {
		id			= adobeId,
		title		= "",
		version		= "",
		status		= "",
		state		= "",
		comments	= 0,
		attachments	= 0,
		votes		= 0
	};
	if (reFindNoCase(variables.patterns.notfound, bugHtml)){
		writeDump(bugHtml);
		bugDetails.title = "BUG NOT FOUND";
		return bugDetails;
	}


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
</cfscript>
