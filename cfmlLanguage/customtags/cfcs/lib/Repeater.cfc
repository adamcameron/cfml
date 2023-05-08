// Repeater.cfc
component {
	public boolean function onStartTag(required struct attributes, required struct caller){
		variables.count = 1
		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		echo("#arguments.generatedContent#<br>")
		return ++count <= attributes.times
	}
}