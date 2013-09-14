<cfscript>
	tagListPage = new me.adamcameron.docs.TagListPage();
	docObject = tagListPage.getDocObject();
	tags = tagListPage.getTags();

	writeDump(tags);
</cfscript>