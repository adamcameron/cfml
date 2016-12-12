component implements=Account {

	property type="numeric" name="id" required=true;
	property type="string" name="companyName" required=true;
	property type=Address name="address" required=true;
		
	function init(required numeric id, required string companyName, required Address address){
		this.id = arguments.id;
		this.companyName = arguments.companyName;
		this.address = arguments.address;
	}
	
	function getMailingAddress(){
		var CRLF = chr(13) & chr(10);
		return "#this.companyName##CRLF#" & this.address.getMailingAddress();
	}
}