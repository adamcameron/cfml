// UnorderedList.cfc
component {

	public UnorderedList function init(Listable collection) {
		variables.collection = arguments.collection;
		return this;
	}

	public string function toList(){
		var items = "";

		while (variables.collection.next()) {
			items &= "<li>#variables.collection.toString()#</li>";
		}

		return "<ul>#items#</ul>";
	}

}