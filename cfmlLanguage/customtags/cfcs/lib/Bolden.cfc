// Bolden.cfc
component {

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		echo('<strong>#generatedContent#</strong>')
		return false
	}
}