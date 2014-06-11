<cfscript>
	if (!thistag.hasEndtag){
		throw(type="UnmatchedStartTagException" message="Context validation error for the footnote tag" detail="The start tag must have a matching end tag.");
	}
	if (listGetAt(getBasetagList(),2) != "cf_page"){
		throw(type="InvalidTagNestingException" message="Context validation error for the footer tag" detail="The tag must be nested inside a page tag.");
	}

	if (thistag.executionMode != "end"){
		exit;
	}
	include "udfs.cfm";
	associate(basetag="cf_page", datacollection="footnoteCollection");
	pageTagData = getBaseTagData("cf_page");
	param pageTagData.footnotes = [];

	thisFootnote = {};
	if (structKeyExists(attributes, "href")){
		thisFootnote.href = attributes.href;
	}
	param attributes.title = thisTag.generatedContent;
	thisFootnote.title = attributes.title;
	arrayAppend(pageTagData.footnotes, thisFootnote);

	thisFootnoteIndex = arrayLen(pageTagData.footnotes);
	thisTag.generatedContent = '<a href="##footNote#thisFootnoteIndex#" class="footnoteLink"><span class="footnote">#thisTag.generatedContent#</span>&nbsp;<sup>#thisFootnoteIndex#</sup></a>';
</cfscript>