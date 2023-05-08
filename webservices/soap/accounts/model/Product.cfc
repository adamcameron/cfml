component {

	property type="numeric" name="id" required=true;
	property type="string" name="description" required=true;
	property type="numeric" name="rrp" required=true;
		
	function init(required numeric id, required string description, required numeric rrp){
		this.id = arguments.id;
		this.description = arguments.description;
		this.rrp = arguments.rrp;
	}
	
}