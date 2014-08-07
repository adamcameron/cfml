// Footnote.cfc
component {

	public Footnote function init(required boolean hasEndTag, required Page parent){
		variables.parent = parent
		return this
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		var thisFootnote = {}
		if (attributes.keyExists("href")){
			thisFootnote.href = attributes.href
		}
		thisFootnote.title = attributes.title ?: generatedContent
		var thisFootnoteIndex = variables.parent.addFootnote(thisFootnote)

		echo('<a href="##footNote#thisFootnoteIndex#" class="footnoteLink"><span class="footnote">#generatedContent#</span>&nbsp;<sup>#thisFootnoteIndex#</sup></a>')
		return false
	}

}