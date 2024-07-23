// MyController.cfc
component {

	init(); // sigh
	
	function init(){
		myService = new MyService(); // I'd  use some sort of DI for this though
	}
	remote Thing function getThing(id) returnFormat="json" {
		return myService.getThing();
	}
}
