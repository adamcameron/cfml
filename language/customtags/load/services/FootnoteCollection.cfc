// PageService.cfc
component {

	variables.footnotes = [];

	public FootnoteCollection function init(){
		return this;
	}

	public string function addFootnote(required string text, string title=arguments.text, string href){
		arrayAppend(variables.footnotes, arguments);
		var thisFootnoteIndex = arrayLen(variables.footnotes);
		return '<a href="##footNote#thisFootnoteIndex#" class="footnoteLink"><span class="footnote">#text#</span>&nbsp;<sup>#thisFootnoteIndex#</sup></a>';
	}

	public string function renderFootnotes(){
		savecontent variable="local.footnoteBlock" {
			if (arrayLen(variables.footnotes)){
				writeOutput("<hr><ol>");

				for (var i=1; i <= arrayLen(variables.footnotes); i++){
					var footnote = variables.footnotes[i];
					writeOutput('<li id="footNote#i#">');
					var textToDisplay = footnote.title;
					if (structKeyExists(footnote, "href")){
						textToDisplay = '<a href="#footnote.href#">#textToDisplay#</a>';
					}
					writeOutput('#textToDisplay#</li>');
				}
				writeOutput("</ol>");
			}
		}
		return local.footnoteBlock;
	}
}