component {

	property type="numeric" name="id" required=true;
	property type="product" name="product" required=true;
	property type="numeric" name="count" required=true;
	property type="numeric" name="price" required=true;
		
	function init(required numeric id, required Product product, required numeric count, required numeric price){
		this.id = arguments.id;
		this.product = arguments.product;
		this.count = arguments.count;
		this.price = arguments.price;
	}

}