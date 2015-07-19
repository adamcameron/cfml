<cfscript>
siteMapPath = expandPath("./sitemaps/");
articlePath = expandPath("./savedArticles/");
directoryList(siteMapPath,false,"array").each(function(siteMapPath){
	xmlParse(siteMapPath)
	.search("//*[local-name()='loc']")
	.each(function(articleUrl){
		articleUrl = articleUrl.xmlText;
		
		var articleFileName = articleUrl.listLast("/");
		writeOutput("Processing #articleFileName#&hellip; ");
		var articleFullPath = articlePath & articleFileName;
		var article = "";

		cfhttp(url=articleUrl, result="article");
		if (fileExists(articleFullPath)){
			articleFullPath &= (createUuid() & ".html");
		}
		fileWrite(articleFullPath, article.fileContent);
		writeOutput("written<br>");
	});
});


</cfscript>