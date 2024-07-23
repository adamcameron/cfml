// Person.cfc
component {
    function init(firstName, lastName) {
        variables.firstName = arguments.firstName
        variables.lastName = arguments.lastName
    }

	function getFullName() {
		return "#firstName# #lastName#"
	}

    static function createFromArray(nameParts) {
        return new variables.this(nameParts[1], nameParts[2])
    }
}
