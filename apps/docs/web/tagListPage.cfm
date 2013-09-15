<cfscript>
	import me.adamcameron.docs.*;

	tagListPage = new TagListPage();
	tags = tagListPage.getTags();

	writeDump(tags);
</cfscript>