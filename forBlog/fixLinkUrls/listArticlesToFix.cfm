<cfscript>
jsoup = createObject("java", "org.jsoup.Jsoup");

articlePath = expandPath("./savedArticles/");

articlesNeedingFixing = [];
directoryList(articlePath).each(function(articlePath){
	var articleName = articlePath.listLast("\");
	var htmlText = fileRead(articlePath);
	var htmlDoc = jsoup.parse(htmlText);
	var articleText = htmlDoc.select(".post-body").html();
	var matches = reMatch("github\.com/daccfml", articleText);
	var matchesLen = matches.len();
	if (matchesLen){
		articlesNeedingFixing.append({
			articleName = articleName,
			count = matchesLen
		});
	}
});	
articlesNeedingFixing.sort(function(e1, e2){
	return sgn(e2.count - e1.count);
});
articlesNeedingFixing = articlesNeedingFixing.map(function(article){
	return "#article.articleName# (#article.count#)";
});

writeDump(articlesNeedingFixing);
</cfscript>