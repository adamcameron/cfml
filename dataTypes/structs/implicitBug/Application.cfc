component {

	this.name = "test3";

	public void function onApplicationStart(){
		var myAttributes = {};
		myAttributes.__app = {
			name = "",
			bundle = ""
		};
		application.myAttributes = myAttributes;	
	}
	
}