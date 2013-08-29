// ColourCollection.cfc
component {

	public ColourCollection function init(required array colours){
		variables.colours = arguments.colours;
		return this;
	}

	public string function _toString(){
		return arrayToList(variables.colours);
	}

}