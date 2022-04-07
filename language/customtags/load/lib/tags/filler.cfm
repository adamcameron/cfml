<cfscript>
	// filler.cfm
	if (thistag.hasEndtag){
		throw(type="IllegalEndTagException", message="Context validation error for the filler tag", detail="The filler tag must not have a matching end tag.");
	}
	param attributes.paragraphs=0;
	if (!attributes.paragraphs){
		exit;
	}
	for (i=1; i <= attributes.paragraphs; i++){
		writeOutput("<p>#application.textUtilsService.fillerText[i]#</p>");
	}
</cfscript>