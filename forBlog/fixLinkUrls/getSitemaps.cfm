<cfscript>
siteMapUrl = "http://blog.adamcameron.me/sitemap.xml";
siteMapDir = expandPath("./sitemaps/");
xmlParse(siteMapUrl).search("//*[local-name()='loc']").each(function(loc){
	var siteMapUrl = loc.xmlText;
	var result = "";
	cfhttp(url=siteMapUrl, result="result");
	var siteMapIteration = siteMapUrl.listLast("=");
	var siteMapFileName = siteMapIteration & ".xml";
	var siteMapFilePath = siteMapDir& siteMapFileName;
	fileWrite(siteMapFilePath, result.fileContent);
});	
</cfscript>