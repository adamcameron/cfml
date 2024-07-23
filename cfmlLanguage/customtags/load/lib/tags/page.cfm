<cfscript>
	if (!thistag.hasEndtag){
		throw(type="UnmatchedStartTagException", message="Context validation error for the page tag", detail="The start tag must have a matching end tag.");
	}
	if (thistag.executionMode != "end"){
		exit "exittemplate";
	}

	if (structKeyExists(thisTag, "footnoteCollection") && arrayLen(thisTag.footnoteCollection)){
		writeOutput("<hr><ol>");

		for (i=1; i <= arrayLen(thisTag.footnoteCollection); i++){
			footnote = thisTag.footnoteCollection[i];
			writeOutput('<li id="footNote#i#">');
			textToDisplay = footnote.title;
			if (structKeyExists(footnote, "href")){
				textToDisplay = '<a href="#footnote.href#">#textToDisplay#</a>';
			}
			writeOutput('#textToDisplay#</li>');
		}
		writeOutput("</ol>");
	}
</cfscript>