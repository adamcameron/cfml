component {
	property type="numeric" name="id" required=true;
	property type="string" name="localPart" required=true;
	property type="string" name="country" required=true;
	property type="string" name="postcode" default="";
	
	function init(required numeric id, required string localPart, required string country, string postCode=""){
		this.id = arguments.id;
		this.localPart = arguments.localPart;
		this.country = arguments.country;
		this.postCode = arguments.postCode;
	}
	
	function getMailingAddress(){
		var CRLF = chr(13) & chr(10);
		return "#this.localPart##CRLF#"
		& "#this.country##CRLF#"
		& "#this.postcode##CRLF#";
	}
}