// Person.cfc
component  accessors=true {
	property Name name;
	property date dob;

	function _toString(){
		return createUuid();
	}
}