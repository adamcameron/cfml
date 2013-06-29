<cfscript>
	feed = new Feed(source="http://rss.imdb.com/user/ur0480544/ratings").read();
	writeDump(variables);
</cfscript>