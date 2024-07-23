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
	votes		= '<div id="votes">.*?Votes\s+\((\d+)\).*?</div>',
	priority	= '<b>Priority</b>\s*(\S+)\s*</div>'
};

public struct function getBug(required numeric adobeId){
	var bugHtml = getBugFromAdobe(adobeId);
	var bugDetails = {
		id			= adobeId,
		title		= "",
		version		= "",
		status		= "",
		state		= "",
		comments	= 0,
		attachments	= 0,
		votes		= 0,
		priority	= ""
	};
	if (reFindNoCase(variables.patterns.notfound, bugHtml)){
		bugDetails.title = "BUG NOT FOUND";
		return bugDetails;
	}

	bugDetails.title		= extractElement(bugHtml, variables.patterns.title);
	bugDetails.version		= extractElement(bugHtml, variables.patterns.version);
	bugDetails.comments		= extractElement(bugHtml, variables.patterns.comments);
	bugDetails.attachments	= extractElement(bugHtml, variables.patterns.attachments);
	bugDetails.votes		= extractElement(bugHtml, variables.patterns.votes);
	bugDetails.priority		= extractElement(bugHtml, variables.patterns.priority);
	structAppend(bugDetails, extractStatusAndState(bugHtml));

	return bugDetails;
}

function getBugFromAdobe(required numeric adobeId){
	var thisBugUrl = variables.bugUrl & adobeId;
	var httpService = new http(
		method		= "get",
		url			= thisBugUrl,
		useragent	= createUuid()
	);
	var response = httpService.send().getPrefix();

	if (response.statusCode != "200 OK"){
		throw(message="Request failed", type="RequestFailedException", detail="The request to #thisBugUrl# returned #response.statusCode#", errorcode=val(response.statusCode));
	}

	return response.fileContent;
}


function extractElement(required string text, required string element){
	var match = reFindNoCase(element, text, 1, true);
	if (arrayLen(match.pos) >= 2){
		return trim(mid(text, match.pos[2], match.len[2]));
	}
	return "";
}

function extractStatusAndState(required string text){
	var result = {
		status	= "",
		state	= ""
	};
	var match = reFindNoCase(variables.patterns.status, text, 1, true);
	if (arrayLen(match.pos) >= 2){
		result.status = trim(mid(text, match.pos[2], match.len[2]));
	}
	if (arrayLen(match.pos) >= 3){
		result.state = trim(mid(text, match.pos[3], match.len[3]));
	}
	return result;
}
</cfscript>