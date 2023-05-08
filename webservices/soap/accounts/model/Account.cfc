component {

	property type="numeric" name="id" required=true;
	property type="string" name="firstName" required=true;
	property type="string" name="lastName" required=true;
	property type="string" name="dateOfBirth" required=true;
	property type=Address name="address" required=true;
		
	function init(required numeric id, required string firstName, required string lastName, required string dateOfBirth, required Address address){
		this.id = arguments.id;
		this.firstName = arguments.firstName;
		this.lastName = arguments.lastName;
		this.dateOfBirth = arguments.dateOfBirth;
		this.address = arguments.address;
	}
	
	function getMailingAddress(){
		var CRLF = chr(13) & chr(10);
		return "#firstName# #lastName##CRLF#" & this.address.getMailingAddress();
	}
}