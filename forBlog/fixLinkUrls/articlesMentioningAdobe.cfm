<cfscript>
jsoup = createObject("java", "org.jsoup.Jsoup");

articlePath = expandPath("./savedArticles/");

articlesMentioningAdobe = [];
directoryList(articlePath).each(function(articlePath){
	var articleName = articlePath.listLast("\");
	var articleNameMentionsAdobe = findNoCase("adobe", articleName);
	var htmlText = fileRead(articlePath);
	var htmlDoc = jsoup.parse(htmlText);
	var articleText = htmlDoc.select(".post-body").text();
	var matches = reMatch("adobe", articleText);
	var matchesLen = matches.len();
	if (matchesLen || articleNameMentionsAdobe){
		articlesMentioningAdobe.append({
			articleName = articleName,
			count = matchesLen,
			fileNameMatch = articleNameMentionsAdobe
		});
	}
});	
articlesMentioningAdobe.sort(function(e1, e2){
	var e1Score = e1.fileNameMatch * e1.count;
	var e2Score = e2.fileNameMatch * e2.count;
	var scoreDiff = sgn(e2Score - e1Score);

	if (scoreDiff) return scoreDiff;
	return sgn(e2.count - e1.count);
});
articlesMentioningAdobe = articlesMentioningAdobe.map(function(article){
	return "#article.articleName# (#article.filenameMatch?true:false#) (#article.count#)";
});

writeDump(articlesMentioningAdobe);
</cfscript>