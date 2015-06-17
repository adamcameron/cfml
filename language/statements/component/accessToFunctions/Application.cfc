component {
	
	
	this.name = "testFunctionAccess";
	
	
	public boolean  function onRequestStart(string thePage){
		return true;
	}

	
	public void  function onRequest(string thePage){
		include arguments.thePage;
		return;
	}


	public function myFunction(){
		return arguments;
	}
}