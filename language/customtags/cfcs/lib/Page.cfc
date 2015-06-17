// Page.cfc
component {

	public Page function init(required boolean hasEndTag){
		variables.footnoteCollection = []
		return this
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		if (!variables.footnoteCollection.len()){
			echo(generatedContent)
			return false
		}
		var footnotes = variables.footnoteCollection.reduce(function(reduction, footnote, i){
			reduction &= '<li id="footNote#i#">'
			var textToDisplay = footnote.title
			if (footnote.keyExists("href")){
				textToDisplay = '<a href="#footnote.href#">#textToDisplay#</a>'
			}
			reduction &= (textToDisplay & "</li>")
			return reduction

		}, "")
		echo(generatedContent &"<hr><ol>" & footnotes & "</ol>")
		return false
	}


	public numeric function addFootnote(required struct footnote){
		footnoteCollection.append(footnote)
		return footnoteCollection.len()
	}

}