// StartTagReturnsFalse.cfc
component {

	public boolean function onStartTag(required struct attributes, required struct caller){
		echo("In start tag<br>")
		return attributes.return ?: true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		echo(generatedContent)
		echo("In end tag<br>")
		return false
	}

}