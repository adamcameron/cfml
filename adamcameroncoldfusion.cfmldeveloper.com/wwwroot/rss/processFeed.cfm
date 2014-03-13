<cfflush interval="16">
<cfscript>
	application.mailService.send(to="cfmlnotifier@gmail.com", subject="STATUS", body="processRss.cfm started @ #now()#");

	statusFile = expandPath("./ColdfusionbloggersorgFeed.dat");
	lastArticleProcessed = "";
	if (fileExists(statusFile)){
		lastArticleProcessed = fileRead(statusFile);
		if (isDate(lastArticleProcessed)){
			lastArticleProcessed =  parseDateTime(lastArticleProcessed);
		}
	}

	message("Last processed article had publish date of @ #len(lastArticleProcessed) ? lastArticleProcessed : '[not set]'#");

	feed = new Feed(source="http://feedproxy.google.com/ColdfusionbloggersorgFeed").read();
	message("Feed contains #arrayLen(feed.name.item)# article(s)<br>");
	for (item in feed.name.item){
		pubDate = parseDateTime(item.pubdate);
		if (!isDate(lastArticleProcessed) || dateCompare(pubDate, lastArticleProcessed) > 0) {
			param mostRecentArticleProcessedDate = pubDate;
			mostRecentArticleProcessedDate = dateCompare(pubDate, mostRecentArticleProcessedDate) > 0 ? pubDate : mostRecentArticleProcessedDate;

			try {
				shortenedUrl = application.bitlyService.shorten(item.link);
				statusUpdate = application.twitterService.createUpdateString("(#item.author#): #item.title#", shortenedUrl);
				application.twitterService.updateStatus(statusUpdate);
				message("#statusUpdate#");
				fileWrite(statusFile, mostRecentArticleProcessedDate);
			} catch (any e){
				message("Error setting status: #e.message# #e.detail# ('#statusUpdate#')", "error");
			}
		}
	}
	message("Finished processing.<br>");
	if (structKeyExists(variables, "mostRecentArticleProcessedDate")){
		message("mostRecentArticleProcessedDate set to #mostRecentArticleProcessedDate#<br>");
	}

	function message(required string message, string type="info"){
		writeOutput(message & "<br />");
		writeLog(file="cfmlnotifier", text=message, type=type);
		if (type == "error"){
			application.mailService.send(to="cfmlnotifier@gmail.com", subject="ERROR processing RSS entry", body=message);
		}		
	}
	application.mailService.send(to="cfmlnotifier@gmail.com", subject="STATUS", body="processRss.cfm completed @ #now()#");
</cfscript>