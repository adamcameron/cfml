component {

	property numeric id;
	property string firstName;
	property string lastName;
	
	public function init(required numeric id, required string firstName, required string lastName){
		this.id = arguments.id;
		this.firstName = arguments.firstName;
		this.lastName = arguments.lastName;
	}

}