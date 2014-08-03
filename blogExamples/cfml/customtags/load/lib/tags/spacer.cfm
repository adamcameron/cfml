<cfscript>
	// spacer.cfm
	if (thistag.hasEndtag){
		throw(type="IllegalEndTagException", message="Context validation error for the spacer tag", detail="The spacer tag must not have a matching end tag.");
	}
	param attributes.lines=0;
	if (!attributes.lines){
		exit;
	}

	for (i=1; i <= attributes.lines; i++){
		writeOutput("<br>");
	}
</cfscript>