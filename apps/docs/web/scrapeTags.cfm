<cfflush interval="16">
<cfscript>
	import me.adamcameron.docs.*;

	tagsDir = expandPath("./tags/");

	tagListPage = new TagListPage();
	tags = tagListPage.getTags();

	for (tag in tags){
		try {
			writeOutput("Scraping #tag.name#<br>");
			docs = new TagPage(tag.url).getDocumentation();
			fileWrite(tagsDir & tag.name & ".json", serializeJson(docs));
			writeDump(var={tagname=docs.tagname, description=docs.description});
		}
		catch (any e){
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
	}
</cfscript>