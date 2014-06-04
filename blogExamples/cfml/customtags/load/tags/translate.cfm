<cfscript>
	if (!thistag.hasEndtag){
		throw(type="UnmatchedStartTagException" message="Context validation error for the translate tag" detail="The start tag must have a matching end tag.");
	}
	if (thistag.executionMode != "end"){
		exit;
	}
	thistag.generatedcontent = application.translationService.translate(thistag.generatedcontent);
</cfscript>