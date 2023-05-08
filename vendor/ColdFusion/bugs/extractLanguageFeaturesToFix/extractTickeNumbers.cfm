<cfscript>
allBugs = {};

baseBugUrl = "https://bugbase.adobe.com/index.cfm?event=bug&id=";

bugLinks = deserializeJson(fileRead(expandPath("./potentials.json"))).query.data.map(function(bug){
	return {id=bug[2], title=bug[5]};
}).filter(function(bug){
	var bugDetailFile = expandPath("./bugcontent/#bug.id#.html");
	if (fileExists(bugDetailFile)){
		bugDetail = fileRead(bugDetailFile);
	}else{
		bugDetail = new Http(argumentCollection=getHttpArgs(bug.id)).send().getPrefix().fileContent;
		fileWrite(bugDetailFile, bugDetail);
	}
	allBugs[bug.id] = bugDetail;
	return bugDetail.reFind("<b>Product Area</b>\s*Language");
}).reduce(function(items, bug){
	return '#items##createListElementForBug(bug)#';
}, "");

writeOutput("<dl>#bugLinks#</dl>");

function getHttpArgs(id){
	return {
		url="#baseBugUrl##id#",
		method="get",
		proxyServer="hh-proxy01.hh.hostelworld.com",
		proxyPort="3128"
	};
}

function createListElementForBug(bug){
	return "<dt>#createBugAnchor(bug)#</dt><dd>COMMENT HERE</dd>";
}

function createBugAnchor(bug){
	return '<a href="#baseBugUrl##bug.id#" target="_blank">(#bug.id#) #encodeForHtml(bug.title)#</a>';
}

function extractDescriptionPrecis(text){
	var precisLen = 200;
	var startMarker = "<h2>Description</h2>";
	var bugText = text.reReplace("(?s)^.*#startMarker#(.*)(?=<h2>Test Configuration</h2>).*$", "\1");
	var withoutTags = bugText.reReplace("<.*?>", " ");
	var precis = withoutTags.trim().left(precisLen);
	return precis.len() < withoutTags.len() ? precis & "&hellip;" : precis;
}

</cfscript>