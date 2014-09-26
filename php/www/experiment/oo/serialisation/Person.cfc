// Person.cfc
component {

	public Person function init(required firstName, required lastName){
		variables.firstName= firstName
		variables.lastName = lastName
		return this
	}

	public function getFullName()  {
		return "#variables.firstName# #variables.lastName#"
	}

}
