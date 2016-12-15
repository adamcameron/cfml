component {

	property type="numeric" name="id" required=true;
	property type=Account name="account" required=true;
	property type="array" name="items" required=false;
	
	function init(required numeric id, required Account account, required array items){
		this.id = arguments.id;
		this.account = arguments.account;
		this.items = arguments.items;
	}
}